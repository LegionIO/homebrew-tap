class Legion < Formula
  desc "Extensible async job engine and agentic AI framework"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8-14/legion-ruby-3.4.8-14-darwin-arm64.tar.gz"
  sha256 "3b7b77a8cdaa67db701d033d3c3f45b6f693f282cc0ffda31c55e1d495f21b44"
  version "3.4.8-14"
  license "Apache-2.0"
  deprecate! date: "2026-03-20", because: "split into legionio-ruby + legionio + legion-tty"

  depends_on "openssl@3"
  depends_on "redis"
  depends_on "snappy"
  depends_on "ollama" => :optional
  depends_on "postgresql@17" => :optional
  depends_on "rabbitmq" => :optional
  depends_on "vault" => :optional

  def install
    # Homebrew auto-strips the top-level directory from the tarball,
    # so bin/, lib/, libexec/ etc. are in the current directory
    libexec.install Dir["bin", "lib", "libexec", "include", "share"]

    # Rewrite shebangs from the build-machine path to the installed ruby
    ruby_bin = libexec/"bin/ruby"
    Dir[libexec/"bin/*"].each do |script|
      next if File.symlink?(script)
      next unless File.file?(script) && File.readable?(script)

      content = File.read(script)
      next unless content.start_with?("#!")
      next unless content.lines.first.include?("ruby")

      content.sub!(%r{#!.*/ruby.*$}, "#!#{ruby_bin}")
      File.write(script, content)
    end

    gem_dir = Dir[libexec/"lib/ruby/gems/*"].first || libexec/"lib/ruby/gems/3.4.0"
    ruby_ver = Dir[libexec/"lib/ruby/[0-9]*"].reject { |p| p.include?("gems") }.first
    ruby_arch = Dir["#{ruby_ver}/arm64-*"].first if ruby_ver
    ruby_lib = [ruby_ver, ruby_arch].compact.join(":")

    env = {
      PATH: "#{libexec}/bin:$PATH",
      RUBYLIB: ruby_lib,
      GEM_HOME: gem_dir,
      GEM_PATH: gem_dir,
      DYLD_FALLBACK_LIBRARY_PATH: libexec/"libexec"
    }

    (bin/"legion").write_env_script libexec/"bin/legion", env
    (bin/"legionio").write_env_script libexec/"bin/legionio", env

    (var/"log/legion").mkpath
    (var/"lib/legion").mkpath
    (var/"run").mkpath

    (share/"legionio/examples").mkpath
    write_example_configs(share/"legionio/examples")
  end

  service do
    run [opt_bin/"legionio", "start", "--log-level", "info"]
    keep_alive true
    working_dir var/"lib/legion"
    log_path var/"log/legion/legion.log"
    error_log_path var/"log/legion/legion.log"
  end

  def post_install
    install_tls_certificates
  end

  def caveats
    <<~EOS
      DEPRECATED: This formula has been split into 3 formulas for faster upgrades.

      To migrate:
        brew uninstall legion
        brew install legion-tty

      legion-tty installs legionio and legionio-ruby automatically.
    EOS
  end

  test do
    assert_match "legionio", shell_output("#{bin}/legion version")
    assert_match "legionio", shell_output("#{bin}/legionio version")
  end

  private

  def install_tls_certificates
    c_rehash = Formula["openssl@3"].opt_bin/"c_rehash"
    cert_dir = HOMEBREW_PREFIX/"etc/openssl@3/certs"
    cert_dir.mkpath

    count = 0

    if OS.mac?
      %w[/Library/Keychains/System.keychain
         /System/Library/Keychains/SystemRootCertificates.keychain].each do |keychain|
        next unless File.exist?(keychain)

        pem_data = `security find-certificate -a -p "#{keychain}" 2>/dev/null`
        certs = pem_data.scan(/-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m)
        certs.each_with_index do |cert, i|
          name = File.basename(keychain, ".keychain").downcase.tr(" ", "-")
          (cert_dir/"#{name}-#{i}.pem").atomic_write(cert + "\n")
        end
        count += certs.size
      end
      ohai "Imported #{count} trusted CA(s) from macOS Keychains"
    else
      system_bundle = %w[
        /etc/ssl/certs/ca-certificates.crt
        /etc/pki/tls/certs/ca-bundle.crt
        /etc/ssl/ca-bundle.pem
      ].find { |p| File.exist?(p) }
      if system_bundle
        cp system_bundle, cert_dir/"system-ca-bundle.pem"
        count = File.read(system_bundle).scan(/BEGIN CERTIFICATE/).size
        ohai "Imported #{count} trusted CA(s) from #{system_bundle}"
      else
        opoo "No system CA bundle found — TLS connections may fail"
      end
    end

    ohai "Rehashing certificate directory"
    system c_rehash.to_s, cert_dir.to_s

    touch HOMEBREW_PREFIX/"etc/openssl@3/certs/.legion-synced"
  end

  def write_example_configs(dir) # rubocop:disable Metrics/MethodLength
    configs = {
      "transport.json.example" => {
        transport: {
          connection: {
            host: "127.0.0.1", port: 5672,
            user: ["vault://secret/data/rabbitmq#username", "env://RABBITMQ_USER", "guest"],
            password: ["vault://secret/data/rabbitmq#password", "env://RABBITMQ_PASSWORD", "guest"],
            vhost: "/"
          }
        }
      },
      "data.json.example" => {
        data: {
          adapter: "sqlite",
          creds: { database: "~/.legionio/legion.db" }
        }
      },
      "cache.json.example" => {
        cache: {
          driver: "dalli",
          servers: ["127.0.0.1:11211"],
          enabled: true
        }
      },
      "crypt.json.example" => {
        crypt: {
          vault: {
            enabled: false, address: "localhost",
            port: 8200, token: "env://VAULT_TOKEN"
          },
          jwt: {
            enabled: true, default_algorithm: "HS256",
            default_ttl: 3600
          }
        }
      },
      "logging.json.example" => {
        logging: {
          level: "info", location: "stdout", trace: true
        }
      },
      "llm.json.example" => {
        llm: {
          enabled: false,
          default_provider: nil,
          default_model: nil,
          providers: {
            anthropic: { enabled: false, api_key: "env://ANTHROPIC_API_KEY" },
            openai: { enabled: false, api_key: "env://OPENAI_API_KEY" },
            gemini: { enabled: false, api_key: "env://GEMINI_API_KEY" },
            bedrock: { enabled: false, region: "us-east-2",
                       bearer_token: ["vault://secret/data/llm/bedrock#bearer_token", "env://AWS_BEARER_TOKEN"] },
            ollama: { enabled: false, base_url: "http://localhost:11434" }
          }
        }
      }
    }

    require "json"
    configs.each do |filename, content|
      (dir/filename).write(JSON.pretty_generate(content) + "\n")
    end
  end
end

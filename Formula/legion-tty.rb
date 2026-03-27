class LegionTty < Formula
  desc "LegionIO interactive terminal shell and AI chat"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-tty-0.4.33-1/legion-tty-gems-0.4.33-1.tar.gz"
  sha256 "be86be7c14e7f63802ab664c189ce99d0b18d6f171e45162ab2c60f1b62fa89a"
  version "0.4.33-1"
  license "Apache-2.0"

  depends_on "legionio/tap/legionio"

  def install
    gem_home = libexec/"gems"
    gem_home.mkpath
    %w[bin gems specifications extensions cache build_info doc plugins].each do |sub|
      gem_home.install sub if (buildpath/sub).exist?
    end

    ruby_formula = Formula["legionio-ruby"]
    daemon_formula = Formula["legionio"]
    ruby_bin = ruby_formula.opt_libexec/"bin"
    ruby_gem_dir = Dir[ruby_formula.opt_libexec/"lib/ruby/gems/*"].first || ruby_formula.opt_libexec/"lib/ruby/gems/3.4.0"

    # The `legion` binstub is provided by the legionio gem (in the daemon formula).
    # Use it from the daemon's GEM_HOME, with our extended GEM_PATH so TTY gems load.
    daemon_bin = daemon_formula.opt_libexec/"gems/bin/legion"
    lib_path_export = if OS.mac?
                         "export DYLD_FALLBACK_LIBRARY_PATH=\"#{ruby_formula.opt_libexec}/libexec\""
                       else
                         "export LD_LIBRARY_PATH=\"#{ruby_formula.opt_libexec}/libexec${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\""
                       end
    (bin/"legion").write <<~BASH
      #!/bin/bash
      export PATH="#{ruby_bin}:$PATH"
      export GEM_PATH="#{gem_home}:#{daemon_formula.opt_libexec}/gems:#{ruby_gem_dir}"
      export GEM_HOME="#{gem_home}"
      export RUBYLIB="#{ruby_lib_path(ruby_formula)}"
      #{lib_path_export}
      # Isolate from system/rbenv gems
      export RUBYGEMS_GEMDEPS=""
      export BUNDLE_GEMFILE=""
      export RUBYOPT=""
      export GEM_SPEC_CACHE="#{gem_home}/spec_cache"
      exec "#{daemon_bin}" "$@"
    BASH
    (bin/"legion").chmod 0755

    (share/"legionio/examples").mkpath
    write_example_configs(share/"legionio/examples")
  end

  def post_install
    install_tls_certificates unless tls_certs_fresh?
  end

  def caveats
    <<~EOS
      Interactive shell (most users):
        legion                           # rich terminal UI with onboarding

      Ruby 3.4.9 with YJIT is bundled — no separate Ruby installation needed.

      The daemon CLI is provided by the legionio formula:
        legionio start                   # start the daemon
        legionio --help                  # all operational commands

      Start Legion as a background service:
        brew services start legionio
    EOS
  end

  test do
    assert_match "legionio", shell_output("#{bin}/legion version")
  end

  private

  def ruby_lib_path(ruby_formula)
    ruby_ver = Dir[ruby_formula.opt_libexec/"lib/ruby/[0-9]*"].reject { |p| p.include?("gems") }.first
    return "" unless ruby_ver

    ruby_arch = (Dir["#{ruby_ver}/arm64-*"] + Dir["#{ruby_ver}/x86_64-*"] + Dir["#{ruby_ver}/aarch64-*"]).first
    [ruby_ver, ruby_arch].compact.join(":")
  end

  def tls_certs_fresh?
    marker = HOMEBREW_PREFIX/"etc/openssl@3/certs/.legion-synced"
    marker.exist? && (Time.now - marker.mtime) < 30 * 24 * 3600
  end

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
        data: { adapter: "sqlite", creds: { database: "~/.legionio/legion.db" } }
      },
      "cache.json.example" => {
        cache: { driver: "dalli", servers: ["127.0.0.1:11211"], enabled: true }
      },
      "crypt.json.example" => {
        crypt: {
          vault: { enabled: false, address: "localhost", port: 8200, token: "env://VAULT_TOKEN" },
          jwt: { enabled: true, default_algorithm: "HS256", default_ttl: 3600 }
        }
      },
      "logging.json.example" => {
        logging: { level: "info", location: "stdout", trace: true }
      },
      "llm.json.example" => {
        llm: {
          enabled: false, default_provider: nil, default_model: nil,
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

class LegionTty < Formula
  desc "LegionIO interactive terminal shell and AI chat"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-tty-0.4.28-2/legion-tty-gems-0.4.28-2.tar.gz"
  sha256 "825ac8256409bf1e5e12f2deb1d7a12983ca10b4e7d08308a5a1c57b49c9901e"
  version "0.4.28-2"
  license "Apache-2.0"

  depends_on "legionio/tap/legionio"

  def install
    libexec.install "gems"

    ruby_formula = Formula["legionio-ruby"]
    daemon_formula = Formula["legionio"]
    ruby_bin = ruby_formula.opt_libexec/"bin"
    ruby_gem_dir = Dir[ruby_formula.opt_libexec/"lib/ruby/gems/*"].first || ruby_formula.opt_libexec/"lib/ruby/gems/3.4.0"

    env = {
      PATH:                       "#{ruby_bin}:$PATH",
      GEM_PATH:                   "#{libexec}/gems:#{daemon_formula.opt_libexec}/gems:#{ruby_gem_dir}",
      GEM_HOME:                   "#{libexec}/gems",
      RUBYLIB:                    ruby_lib_path(ruby_formula),
      DYLD_FALLBACK_LIBRARY_PATH: ruby_formula.opt_libexec/"libexec"
    }

    legion_bin = libexec/"gems/bin/legion"
    if legion_bin.exist?
      (bin/"legion").write_env_script legion_bin, env
    else
      (bin/"legion").write_env_script ruby_bin/"legion", env
    end

    (share/"legionio/examples").mkpath
    write_example_configs(share/"legionio/examples")
  end

  def post_install
    install_tls_certificates
  end

  def caveats
    <<~EOS
      Interactive shell (most users):
        legion                           # rich terminal UI with onboarding

      Ruby 3.4.8 with YJIT is bundled — no separate Ruby installation needed.

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
    ruby_arch = Dir["#{ruby_ver}/arm64-*"].first if ruby_ver
    [ruby_ver, ruby_arch].compact.join(":")
  end

  def install_tls_certificates
    openssl = Formula["openssl@3"].opt_bin/"openssl"
    c_rehash = Formula["openssl@3"].opt_bin/"c_rehash"
    cert_dir = HOMEBREW_PREFIX/"etc/openssl@3/certs"
    cert_dir.mkpath

    %w[rubygems.org github.com].each do |host|
      ohai "Fetching TLS certificate chain for #{host}"
      begin
        output = `echo | #{openssl} s_client -showcerts -connect #{host}:443 2>/dev/null`
        certs = output.scan(/-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m)
        certs.each_with_index do |cert, i|
          (cert_dir/"#{host}-#{i}.pem").atomic_write(cert + "\n")
        end
        ohai "  Saved #{certs.size} certificate(s) for #{host}"
      rescue => e
        opoo "Could not fetch certificates for #{host}: #{e.message}"
      end
    end

    ohai "Rehashing certificate directory"
    system c_rehash.to_s, cert_dir.to_s
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

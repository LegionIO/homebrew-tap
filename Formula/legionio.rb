class Legionio < Formula
  desc "LegionIO async job engine, agentic AI daemon, and interactive shell"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-1.5.0-2/legion-1.5.0-2-darwin-arm64.tar.gz"
  sha256 "b0373fdef262c3db2f6bee82363b34e633388742a6880e039ac9d59c4a1b4dbd"
  version "1.5.0-2"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/LegionIO/homebrew-tap/releases/download/bottles-legionio-1.5.0-2"
    sha256 cellar: :any, arm64_sequoia: "5a074001d94628ef7ea997c8524e840f6c819ade4656b6a9f572cc7dc90f8d97"
    sha256 cellar: :any, arm64_sonoma: "fd77afcb3582a44dbbd53736966bc8d2a497b90ca4b9f10bdcca9aad81110c3d"
  end

  depends_on "openssl@3"
  depends_on "snappy"
  depends_on "redis" => :recommended
  depends_on "ollama" => :optional
  depends_on "postgresql@17" => :optional
  depends_on "rabbitmq" => :optional
  depends_on "vault" => :optional

  def install
    libexec.install Dir["bin", "lib", "libexec", "include", "share"]

    ruby_bin = libexec/"bin/ruby"

    # Rewrite shebangs from build-machine paths to installed ruby
    Dir[libexec/"bin/*"].each do |script|
      next if File.symlink?(script)
      next unless File.file?(script) && File.readable?(script)

      content = File.read(script)
      next unless content.start_with?("#!")
      next unless content.lines.first.include?("ruby")

      content.sub!(%r{#!.*/ruby.*$}, "#!#{ruby_bin}")
      File.write(script, content)
    end

    # Isolate gem discovery to the Cellar — prevent ~/.gem and rbenv leaking in
    gem_dir = Dir[libexec/"lib/ruby/gems/*"].first || libexec/"lib/ruby/gems/3.4.0"
    ruby_ver = File.basename(gem_dir)
    defaults_dir = libexec/"lib/ruby/site_ruby"/ruby_ver/"rubygems/defaults"
    defaults_dir.mkpath
    (defaults_dir/"operating_system.rb").write <<~RUBY
      module Gem
        def self.default_dir
          "#{gem_dir}"
        end

        def self.user_dir
          default_dir
        end

        def self.default_path
          [default_dir]
        end
      end

      ENV["BUNDLE_GEMFILE"] ||= ""
      ENV["RUBYGEMS_GEMDEPS"] ||= ""
    RUBY

    ruby_lib = ruby_lib_path

    # legionio — daemon CLI
    (bin/"legionio").write <<~BASH
      #!/bin/bash
      export PATH="#{libexec}/bin:$PATH"
      export GEM_PATH="#{gem_dir}"
      export GEM_HOME="#{gem_dir}"
      export RUBYLIB="#{ruby_lib}"
      export DYLD_FALLBACK_LIBRARY_PATH="#{libexec}/libexec"
      export RUBYGEMS_GEMDEPS=""
      export BUNDLE_GEMFILE=""
      export RUBYOPT=""
      export GEM_SPEC_CACHE="#{gem_dir}/spec_cache"
      exec "#{libexec}/bin/ruby" "#{libexec}/bin/legionio" "$@"
    BASH
    (bin/"legionio").chmod 0755

    # legion — interactive shell (TTY)
    (bin/"legion").write <<~BASH
      #!/bin/bash
      export PATH="#{libexec}/bin:$PATH"
      export GEM_PATH="#{gem_dir}"
      export GEM_HOME="#{gem_dir}"
      export RUBYLIB="#{ruby_lib}"
      export DYLD_FALLBACK_LIBRARY_PATH="#{libexec}/libexec"
      export RUBYGEMS_GEMDEPS=""
      export BUNDLE_GEMFILE=""
      export RUBYOPT=""
      export GEM_SPEC_CACHE="#{gem_dir}/spec_cache"
      exec "#{libexec}/bin/ruby" "#{libexec}/bin/legion" "$@"
    BASH
    (bin/"legion").chmod 0755

    # Dev helpers — expose bundled ruby tools
    (bin/"legion-ruby").write <<~BASH
      #!/bin/bash
      exec "#{ruby_bin}" "$@"
    BASH
    (bin/"legion-ruby").chmod 0755

    %w[gem bundle irb].each do |tool|
      (bin/"legion-#{tool}").write <<~BASH
        #!/bin/bash
        exec "#{ruby_bin}" "#{libexec}/bin/#{tool}" "$@"
      BASH
      (bin/"legion-#{tool}").chmod 0755
    end

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
    environment_variables LANG: "en_US.UTF-8", LC_ALL: "en_US.UTF-8"
  end

  def post_install
    install_tls_certificates
  end

  def caveats
    <<~EOS
      Interactive shell:
        legion                           # rich terminal UI with onboarding

      Daemon CLI:
        legionio start                   # start the daemon
        legionio config scaffold         # generate config files
        legionio lex list                # list extensions
        legionio --help                  # all operational commands

      Dev helpers (bundled Ruby #{version.to_s.split("-").first} with YJIT):
        legion-ruby                      # ruby interpreter
        legion-gem                       # gem command
        legion-bundle                    # bundler
        legion-irb                       # interactive ruby

      Config:  ~/.legionio/settings/
      Logs:    #{var}/log/legion/legion.log
      Data:    #{var}/lib/legion/

      Start as background service:
        brew services start legionio

      Start Redis (required for tracing and dream cycle):
        brew services start redis

      Optional services:
        brew services start rabbitmq         # job engine messaging
        brew services start postgresql@17    # legion-data persistence
        brew services start vault            # legion-crypt secrets
        ollama serve                         # local LLM
    EOS
  end

  test do
    ruby_bin = libexec/"bin/ruby"
    assert_match "ruby", shell_output("#{ruby_bin} -v")
    assert_match "legionio", shell_output("#{bin}/legionio version")
    assert_match "legionio", shell_output("#{bin}/legion version")
  end

  private

  def ruby_lib_path
    ruby_ver = Dir[libexec/"lib/ruby/[0-9]*"].reject { |p| p.include?("gems") }.first
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

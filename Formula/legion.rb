class Legion < Formula
  desc "Extensible async job engine and agentic AI framework"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8/legion-ruby-3.4.8-darwin-arm64.tar.gz"
  sha256 "b78e505ce7f339a0845693ad6891a64260f415fc82a655b1b1584706cdbde901"
  version "3.4.8-1"
  license "Apache-2.0"

  depends_on "redis"
  depends_on "ollama" => :optional
  depends_on "postgresql@17" => :optional
  depends_on "rabbitmq" => :optional
  depends_on "vault" => :optional

  def install
    # Homebrew auto-strips the top-level directory from the tarball,
    # so bin/, lib/, libexec/ etc. are in the current directory
    libexec.install Dir["bin", "lib", "libexec", "include", "share"]

    gem_dir = Dir[libexec/"lib/ruby/gems/*"].first || libexec/"lib/ruby/gems/3.4.0"
    env = {
      PATH: "#{libexec}/bin:$PATH",
      GEM_HOME: gem_dir,
      GEM_PATH: gem_dir,
      DYLD_FALLBACK_LIBRARY_PATH: libexec/"libexec"
    }

    (bin/"legion").write_env_script libexec/"bin/legion", env

    (var/"log/legion").mkpath
    (var/"lib/legion").mkpath
    (var/"run").mkpath

    (share/"legionio/examples").mkpath
    write_example_configs(share/"legionio/examples")
  end

  def post_install
    system libexec/"bin/gem", "update", "legionio", "legion-data", "legion-llm",
           "--no-document"

    config_dir = Pathname.new(Dir.home)/".legionio/settings"
    config_dir.mkpath

    Dir.glob(share/"legionio/examples/*.json.example").each do |example|
      target = config_dir/File.basename(example)
      cp example, target unless target.exist?
    end
  end

  service do
    run [opt_bin/"legion", "start", "--log-level", "info"]
    keep_alive true
    working_dir var/"lib/legion"
    log_path var/"log/legion/legion.log"
    error_log_path var/"log/legion/legion.log"
  end

  def caveats
    <<~EOS
      Config:  ~/.legionio/settings/ (example files installed on first install)
      Logs:    #{var}/log/legion/legion.log
      Data:    #{var}/lib/legion/

      Ruby 3.4.8 with YJIT is bundled — no separate Ruby installation needed.

      To start Legion as a background service:
        brew services start legion

      Start Redis (required for tracing and dream cycle):
        brew services start redis

      Optional services:
        brew services start rabbitmq         # job engine messaging
        brew services start postgresql@17    # legion-data persistence
        brew services start vault            # legion-crypt secrets
        ollama serve                         # local LLM for legion chat

      To regenerate example configs (won't overwrite existing):
        legion config scaffold
    EOS
  end

  test do
    assert_match "Legion", shell_output("#{bin}/legion version")
  end

  private

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

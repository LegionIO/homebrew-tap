class Legion < Formula
  desc "Extensible async job engine and agentic AI framework for Ruby"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://rubygems.org/downloads/legionio-1.4.8.gem"
  sha256 "e58db552597d3ecbaa8598ac512b0af491c679213f1c9197c22286c1f3064892"
  license "Apache-2.0"

  depends_on "ruby"
  depends_on "redis"
  depends_on "ollama" => :optional
  depends_on "postgresql@17" => :optional
  depends_on "rabbitmq" => :optional
  depends_on "vault" => :optional

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec

    system "gem", "install", "--no-document", "--install-dir", libexec, cached_download

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec, GEM_PATH: libexec)

    (var/"log/legion").mkpath
    (var/"lib/legion").mkpath
    (var/"run").mkpath

    # Install example config files to share/ for post_install to copy
    (share/"legionio/examples").install_symlink [] # ensure dir exists
    (share/"legionio/examples").mkpath
    write_example_configs(share/"legionio/examples")
  end

  def post_install
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
    assert_match version.to_s, shell_output("#{bin}/legion version")
  end

  private

  def write_example_configs(dir) # rubocop:disable Metrics/MethodLength
    configs = {
      "transport.json.example" => {
        transport: {
          connection: {
            host: "127.0.0.1", port: 5672,
            user: "guest", password: "guest", vhost: "/"
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
            port: 8200, token: nil
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
            anthropic: { enabled: false, api_key: nil },
            openai: { enabled: false, api_key: nil },
            gemini: { enabled: false, api_key: nil },
            bedrock: { enabled: false, region: "us-east-2" },
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

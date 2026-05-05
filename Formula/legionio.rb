class Legionio < Formula
  desc "LegionIO async job engine, agentic AI daemon, and interactive shell"
  homepage "https://github.com/LegionIO/LegionIO"
  version "1.9.18-1"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-1.9.18-1/legion-1.9.18-1-darwin-arm64.tar.gz"
    sha256 "011af8a3c983e188a59efd85f4ad8acb14a7ff15a6fb7f5ff497b971692d4401"
  end

  on_intel do
    url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-1.9.18-1/legion-1.9.18-1-darwin-x86_64.tar.gz"
    sha256 "e8510f00c0493a9d7dc2fea75abd61f2e2858454f459296d63be8711fe8b7f07"
  end













  bottle do
    root_url "https://github.com/LegionIO/homebrew-tap/releases/download/bottles-legionio-1.9.3-1"
    sha256 cellar: :any, arm64_sequoia: "78ea0896bdd8d8449f7425486366acf9ae1eba574b91764e8a2b22fd94ad0bea"
    sha256 cellar: :any, arm64_sonoma: "50875b1ab845d83c2cb9799df94493b08ed2c0a83cbe25c8fc2dc59ea9d6b960"
    sha256 cellar: :any, sequoia: "d05f491eb7502f0098cda16074e0d2dcc0e16028381116f5019e8c577c65879e"
  end

  depends_on "krb5"
  depends_on "openssl@3"
  depends_on "python@3.13" => :recommended
  depends_on "snappy"
  depends_on "redis" => :recommended

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
    krb5_lib = Formula["krb5"].opt_lib
    lib_path_export = if OS.mac?
                         "export DYLD_FALLBACK_LIBRARY_PATH=\"#{libexec}/libexec:#{krb5_lib}${DYLD_FALLBACK_LIBRARY_PATH:+:$DYLD_FALLBACK_LIBRARY_PATH}\""
                       else
                         "export LD_LIBRARY_PATH=\"#{libexec}/libexec${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\""
                       end

    # legionio — daemon CLI
    (bin/"legionio").write <<~BASH
      #!/bin/bash
      export PATH="#{libexec}/bin:$PATH"
      export GEM_PATH="#{gem_dir}"
      export GEM_HOME="#{gem_dir}"
      export RUBYLIB="#{ruby_lib}"
      #{lib_path_export}
      export RUBYGEMS_GEMDEPS=""
      export BUNDLE_GEMFILE=""
      export RUBYOPT=""
      export GEM_SPEC_CACHE="#{gem_dir}/spec_cache"
      export LEGION_PYTHON_VENV="#{libexec}/python"
      export LEGION_PYTHON="#{libexec}/python/bin/python3"
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
      #{lib_path_export}
      export RUBYGEMS_GEMDEPS=""
      export BUNDLE_GEMFILE=""
      export RUBYOPT=""
      export GEM_SPEC_CACHE="#{gem_dir}/spec_cache"
      export LEGION_PYTHON_VENV="#{libexec}/python"
      export LEGION_PYTHON="#{libexec}/python/bin/python3"
      exec "#{libexec}/bin/ruby" "#{libexec}/bin/legion" "$@"
    BASH
    (bin/"legion").chmod 0755

    # Dev helpers — expose bundled ruby tools
    (bin/"legion-ruby").write <<~BASH
      #!/bin/bash
      #{lib_path_export}
      exec "#{ruby_bin}" "$@"
    BASH
    (bin/"legion-ruby").chmod 0755

    %w[gem bundle irb].each do |tool|
      (bin/"legion-#{tool}").write <<~BASH
        #!/bin/bash
        #{lib_path_export}
        exec "#{ruby_bin}" "#{libexec}/bin/#{tool}" "$@"
      BASH
      (bin/"legion-#{tool}").chmod 0755
    end

    # Python venv helpers — use the Legion-managed venv interpreter/pip
    (bin/"legion-python").write <<~BASH
      #!/bin/bash
      VENV="${LEGION_PYTHON_VENV:-${HOME}/.legionio/python}"
      if [ -x "${VENV}/bin/python3" ]; then
        exec "${VENV}/bin/python3" "$@"
      else
        echo "Legion Python venv not found. Run: legionio setup python" >&2
        exit 1
      fi
    BASH
    (bin/"legion-python").chmod 0755

    (bin/"legion-pip").write <<~BASH
      #!/bin/bash
      VENV="${LEGION_PYTHON_VENV:-${HOME}/.legionio/python}"
      if [ -x "${VENV}/bin/pip3" ]; then
        exec "${VENV}/bin/pip3" "$@"
      else
        echo "Legion Python venv not found. Run: legionio setup python" >&2
        exit 1
      fi
    BASH
    (bin/"legion-pip").chmod 0755

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
    reinstall_packs
    setup_python_venv
    background_gem_update
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

      Dev helpers (bundled Ruby 3.4 with YJIT):
        legion-ruby                      # ruby interpreter
        legion-gem                       # gem command
        legion-bundle                    # bundler
        legion-irb                       # interactive ruby

      Python helpers (Legion-managed venv):
        legion-python                    # python3 interpreter
        legion-pip                       # pip3 package manager

      Python environment (for document/data tools):
        legionio setup python            # create/repair venv + install packages
        legionio setup python --rebuild  # destroy and recreate from scratch
        legionio setup python --packages <name> [<name>...]  # add extra packages
        $LEGION_PYTHON                   # path to the venv interpreter
        $LEGION_PYTHON_VENV              # path to the venv root

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

  PYTHON_PACKAGES = %w[
    python-pptx python-docx openpyxl pandas pillow
    requests lxml PyYAML tabulate markdown PyMuPDF
  ].freeze

  def setup_python_venv
    python3 = find_python3
    unless python3
      opoo "python3 not found — skipping Python venv setup. Install with: brew install python"
      return
    end

    venv_dir = libexec/"python"
    if venv_dir.exist?
      ohai "Legion Python venv already exists at #{venv_dir}"
    else
      ohai "Creating Legion Python venv at #{venv_dir}"
      unless system python3, "-m", "venv", venv_dir.to_s
        opoo "Failed to create Python venv — run 'legionio setup python' manually"
        return
      end
    end

    pip = venv_dir/"bin/pip3"
    unless pip.executable?
      opoo "pip3 not found in venv — run 'legionio setup python --rebuild'"
      return
    end

    ohai "Installing Python packages: #{PYTHON_PACKAGES.join(', ')}"
    unless system pip.to_s, "install", "--quiet", "--upgrade", *PYTHON_PACKAGES
      opoo "Some Python packages failed — run 'legionio setup python' to retry"
    end

    ohai "Legion Python environment ready: #{venv_dir}/bin/python3"
  end

  def find_python3
    # 1. Prefer the Homebrew-managed Python dependency when available
    if Formula["python@3.13"].any_version_installed?
      candidate = Formula["python@3.13"].opt_bin/"python3"
      return candidate.to_s if candidate.executable?
    end

    # 2. Resolve via PATH (handles Linuxbrew, nix, non-default prefixes, etc.)
    path_python = which("python3")
    return path_python.to_s if path_python

    # 3. Fall back to well-known locations as a last resort
    %w[/opt/homebrew/bin/python3 /usr/local/bin/python3 /usr/bin/python3].find { |p| File.executable?(p) }
  end

  def reinstall_packs
    packs = discover_installed_packs
    return if packs.empty?

    packs.each do |pack|
      ohai "Reinstalling #{pack} pack after upgrade"
      unless system bin/"legionio", "setup", pack
        opoo "Pack '#{pack}' reinstall failed — run 'legionio setup #{pack}' manually after upgrade"
      end
    end
  end

  def discover_installed_packs
    require "json"
    require "set"
    packs = Set.new

    # Source 1: marker files from prior `legionio setup <pack>`
    packs_dir = File.expand_path("~/.legionio/.packs")
    if File.directory?(packs_dir)
      Dir.children(packs_dir).each { |p| packs << p }
    end

    # Source 2: settings file (user-configurable)
    settings_file = File.expand_path("~/.legionio/settings/packs.json")
    if File.exist?(settings_file)
      data = JSON.parse(File.read(settings_file)) rescue {}
      Array(data["packs"]).each { |p| packs << p.to_s }
    end

    packs.to_a.sort
  end

  def background_gem_update
    ohai "Updating legion gems in background"
    log_file = var/"log/legion/post-upgrade-update.log"
    pid = spawn(
      (bin/"legionio").to_s, "update",
      [:out, :err] => [log_file.to_s, "w"],
      pgroup: true
    )
    ::Process.detach(pid)
  end

  def ruby_lib_path
    ruby_ver = Dir[libexec/"lib/ruby/[0-9]*"].reject { |p| p.include?("gems") }.first
    return "" unless ruby_ver

    # Match platform-specific arch dir (arm64-darwin*, x86_64-linux*, aarch64-linux*)
    ruby_arch = (Dir["#{ruby_ver}/arm64-*"] + Dir["#{ruby_ver}/x86_64-*"] + Dir["#{ruby_ver}/aarch64-*"]).first
    [ruby_ver, ruby_arch].compact.join(":")
  end

  def cert_fresh?(marker_name)
    marker = HOMEBREW_PREFIX/"etc/openssl@3/certs/.legionio-#{marker_name}-cert-synced"
    marker.exist? && (Time.now - marker.mtime) < 30 * 24 * 3600
  end

  def mark_cert_synced!(marker_name)
    touch HOMEBREW_PREFIX/"etc/openssl@3/certs/.legionio-#{marker_name}-cert-synced"
  end

  def install_tls_certificates
    openssl = Formula["openssl@3"].opt_bin/"openssl"
    c_rehash = Formula["openssl@3"].opt_bin/"c_rehash"
    cert_dir = HOMEBREW_PREFIX/"etc/openssl@3/certs"
    cert_dir.mkpath

    needs_rehash = false

    # Import system/corporate CAs from OS trust store
    unless cert_fresh?("keychain")
      count = 0
      if OS.mac?
        # This picks up corporate CAs (Zscaler, MDM, etc.) and system root CAs
        # so our bundled Ruby/OpenSSL trusts the same hosts as the rest of macOS.
        # The login keychain is where JAMF/corporate provisioning drops internal CAs.
        login_keychain = File.expand_path("~/Library/Keychains/login.keychain-db")
        keychains = %w[/Library/Keychains/System.keychain
                       /System/Library/Keychains/SystemRootCertificates.keychain]
        keychains << login_keychain
        keychains.each do |keychain|
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

      if count > 0
        mark_cert_synced!("keychain")
        needs_rehash = true
      else
        opoo "No system certificates were imported"
      end
    end

    # Fetch live certificate chains for critical hosts so gem install and
    # API calls work even when the system keychain lacks intermediate CAs.
    %w[rubygems github legionio].each do |name|
      next if cert_fresh?(name)

      host = { "rubygems" => "rubygems.org", "github" => "github.com", "legionio" => "legionio.dev" }[name]
      ohai "Fetching TLS certificate chain for #{host}"
      begin
        output = `echo | #{openssl} s_client -showcerts -connect #{host}:443 2>/dev/null`
        certs = output.scan(/-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m)
        certs.each_with_index do |cert, i|
          (cert_dir/"#{host}-#{i}.pem").atomic_write(cert + "\n")
        end
        if certs.any?
          ohai "  Saved #{certs.size} certificate(s) for #{host}"
          mark_cert_synced!(name)
          needs_rehash = true
        else
          opoo "No certificates returned for #{host}"
        end
      rescue => e
        opoo "Could not fetch certificates for #{host}: #{e.message}"
      end
    end

    if needs_rehash
      ohai "Rehashing certificate directory"
      system c_rehash.to_s, cert_dir.to_s
    end
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

class Legionio < Formula
  desc "LegionIO async job engine and agentic AI daemon"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/legionio-1.4.90-3/legionio-gems-1.4.90-3.tar.gz"
  sha256 "d3180fcc34ff5444c80ec12f19ce4525b53476b1b07d727e937c9b5757425414"
  version "1.4.90-3"
  license "Apache-2.0"

  depends_on "legionio/tap/legionio-ruby"
  depends_on "redis"
  depends_on "ollama" => :optional
  depends_on "postgresql@17" => :optional
  depends_on "rabbitmq" => :optional
  depends_on "vault" => :optional

  def install
    gem_home = libexec/"gems"
    gem_home.mkpath
    # Homebrew strips the top-level tarball directory, so bin/, gems/,
    # specifications/ etc. are at the build root — install them all
    # into libexec/gems to reconstruct a complete GEM_HOME.
    %w[bin gems specifications extensions cache build_info doc plugins].each do |sub|
      gem_home.install sub if (buildpath/sub).exist?
    end

    ruby_formula = Formula["legionio-ruby"]
    ruby_bin = ruby_formula.opt_libexec/"bin"
    ruby_gem_dir = Dir[ruby_formula.opt_libexec/"lib/ruby/gems/*"].first || ruby_formula.opt_libexec/"lib/ruby/gems/3.4.0"

    env = {
      PATH:                       "#{ruby_bin}:$PATH",
      GEM_PATH:                   "#{gem_home}:#{ruby_gem_dir}",
      GEM_HOME:                   gem_home.to_s,
      RUBYLIB:                    ruby_lib_path(ruby_formula),
      DYLD_FALLBACK_LIBRARY_PATH: ruby_formula.opt_libexec/"libexec"
    }

    (bin/"legionio").write_env_script gem_home/"bin/legionio", env

    (var/"log/legion").mkpath
    (var/"lib/legion").mkpath
    (var/"run").mkpath
  end

  service do
    run [opt_bin/"legionio", "start", "--log-level", "info"]
    keep_alive true
    working_dir var/"lib/legion"
    log_path var/"log/legion/legion.log"
    error_log_path var/"log/legion/legion.log"
  end

  def caveats
    <<~EOS
      Operational CLI (daemon, extensions, tasks):
        legionio start                   # start the daemon
        legionio config scaffold         # generate config files
        legionio lex list                # list extensions
        legionio --help                  # all operational commands

      Config:  ~/.legionio/settings/
      Logs:    #{var}/log/legion/legion.log
      Data:    #{var}/lib/legion/

      To start Legion as a background service:
        brew services start legionio

      Start Redis (required for tracing and dream cycle):
        brew services start redis

      Optional services:
        brew services start rabbitmq         # job engine messaging
        brew services start postgresql@17    # legion-data persistence
        brew services start vault            # legion-crypt secrets
        ollama serve                         # local LLM

      For the interactive shell, install legion-tty:
        brew install legion-tty
    EOS
  end

  test do
    assert_match "legionio", shell_output("#{bin}/legionio version")
  end

  private

  def ruby_lib_path(ruby_formula)
    ruby_ver = Dir[ruby_formula.opt_libexec/"lib/ruby/[0-9]*"].reject { |p| p.include?("gems") }.first
    ruby_arch = Dir["#{ruby_ver}/arm64-*"].first if ruby_ver
    [ruby_ver, ruby_arch].compact.join(":")
  end
end

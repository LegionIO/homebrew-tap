class LegionioFull < Formula
  desc "LegionIO full stack: daemon, shell, Redis, Ollama, and PostgreSQL"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/legion-1.8.6-2/legion-1.8.6-2-darwin-arm64.tar.gz"
  sha256 "9eff5c5a70d3df27eae15071ffc9482b50bf572bc6ca128ddae1fde63fb0b93e"
  version "1.8.6-2"
  license "Apache-2.0"

  depends_on "legionio/tap/legionio"
  depends_on "legionio/tap/legion-tty"
  depends_on "ollama"
  depends_on "postgresql@17"
  depends_on "redis"

  def install
    (prefix/"README").write <<~EOS
      This is a meta-package that installs the LegionIO full stack.
      Includes: legionio daemon, legion interactive shell, Redis, Ollama, and PostgreSQL.
    EOS
  end

  def caveats
    <<~EOS
      Start all services:
        brew services start legionio
        brew services start redis
        brew services start postgresql@17
        ollama serve

      Interactive shell:
        legion

      Daemon CLI:
        legionio start
        legionio --help
    EOS
  end

  test do
    assert_match "legionio", shell_output("#{Formula["legionio/tap/legionio"].opt_bin}/legionio version")
  end
end

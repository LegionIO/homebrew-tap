class LegionDev < Formula
  desc "Full LegionIO development environment with all services"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://rubygems.org/downloads/legionio-1.4.8.gem"
  sha256 "e58db552597d3ecbaa8598ac512b0af491c679213f1c9197c22286c1f3064892"
  license "Apache-2.0"

  depends_on "legionio/tap/legion"
  depends_on "ollama"
  depends_on "postgresql@17"
  depends_on "rabbitmq"
  depends_on "rbenv"
  depends_on "redis"
  depends_on "vault"

  def install
    (prefix/"README").write <<~EOS
      This is a meta-package that installs the full LegionIO development stack.
      The legion CLI is provided by the legion formula.
    EOS
  end

  def caveats
    <<~EOS
      Start all services for local development:
        brew services start legion
        brew services start redis
        brew services start rabbitmq
        brew services start postgresql@17
        brew services start vault
        ollama serve

      Set up Ruby via rbenv:
        rbenv install 3.4.2
        rbenv global 3.4.2
    EOS
  end

  test do
    system "legion", "version"
  end
end

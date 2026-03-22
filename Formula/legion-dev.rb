class LegionDev < Formula
  desc "Full LegionIO development environment with all services"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8/legion-ruby-3.4.8-darwin-arm64.tar.gz"
  sha256 "a5b95f5dcfe36dc9c5b0250f3fab82df0624e7dfd37af2bc9f73f39e34a88ef0"
  version "3.4.8-1"
  license "Apache-2.0"

  depends_on "legionio/tap/legionio"
  depends_on "ollama"
  depends_on "postgresql@17"
  depends_on "rabbitmq"
  depends_on "rbenv" => :recommended
  depends_on "redis"
  depends_on "vault"

  def install
    (prefix/"README").write <<~EOS
      This is a meta-package that installs the full LegionIO development stack.
      The legion CLI is provided by the legion-tty formula. The legionio daemon CLI is provided by the legionio formula.
    EOS
  end

  def caveats
    <<~EOS
      Start all services for local development:
        brew services start legionio
        brew services start redis
        brew services start rabbitmq
        brew services start postgresql@17
        brew services start vault
        ollama serve

      Ruby 3.4.8 with YJIT is bundled with the legion formula.
      For extension development with your own Ruby, install via rbenv:
        rbenv install 3.4.8
        rbenv global 3.4.8
    EOS
  end

  test do
    system "legion", "version"
  end
end

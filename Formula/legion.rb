class Legion < Formula
  desc "Extensible async job engine for Ruby with plugin-based service integrations"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://rubygems.org/downloads/legionio-1.2.1.gem"
  sha256 "959c9c7052eccd9dfe25600f114a318846dc5d473040df8649595cc6bd69dd1d"
  license "Apache-2.0"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec

    system "gem", "install", "--no-document", "--install-dir", libexec, cached_download

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", GEM_HOME: libexec, GEM_PATH: libexec)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/legion version")
  end
end

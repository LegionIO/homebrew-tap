class Legion < Formula
  desc "Extensible async job engine and agentic AI framework for Ruby"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://rubygems.org/downloads/legionio-1.4.8.gem"
  sha256 "e58db552597d3ecbaa8598ac512b0af491c679213f1c9197c22286c1f3064892"
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

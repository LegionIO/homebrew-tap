class LegionioRuby < Formula
  desc "Ruby runtime with native extensions for LegionIO"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8-13/legion-ruby-3.4.8-13-darwin-arm64.tar.gz"
  sha256 "3839ccedf2c31f3434f2bb4984e92664c9e6c17ef0517efda2cca2c0e0f311e3"
  version "3.4.8-13"
  license "Apache-2.0"

  depends_on "openssl@3"
  depends_on "snappy"

  def install
    libexec.install Dir["bin", "lib", "libexec", "include", "share"]

    ruby_bin = libexec/"bin/ruby"
    Dir[libexec/"bin/*"].each do |script|
      next if File.symlink?(script)
      next unless File.file?(script) && File.readable?(script)

      content = File.read(script)
      next unless content.start_with?("#!")
      next unless content.lines.first.include?("ruby")

      content.sub!(%r{#!.*/ruby.*$}, "#!#{ruby_bin}")
      File.write(script, content)
    end
  end

  test do
    ruby_bin = libexec/"bin/ruby"
    assert_match "ruby", shell_output("#{ruby_bin} -v")
    shell_output("#{ruby_bin} -e \"RubyVM::YJIT.enable; puts RubyVM::YJIT.enabled?\"")
    shell_output("#{ruby_bin} -e \"require 'sqlite3'; puts 'ok'\"")
    shell_output("#{ruby_bin} -e \"require 'oj'; puts 'ok'\"")
  end
end

class LegionioRuby < Formula
  desc "Ruby runtime with native extensions for LegionIO"
  homepage "https://github.com/LegionIO/LegionIO"
  url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8-16/legion-ruby-3.4.8-16-darwin-arm64.tar.gz"
  sha256 "c3499d18e292f97f718e754ea8684260b2587fb008766045fb2a79c7d285b9aa"
  version "3.4.8-16"
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

    # Isolate gem discovery to the Cellar — prevent ~/.gem and rbenv leaking in
    gem_dir = Dir[libexec/"lib/ruby/gems/*"].first || libexec/"lib/ruby/gems/3.4.0"
    ruby_ver = File.basename(gem_dir) # e.g. "3.4.0"
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

      # Prevent Bundler from resolving local Gemfiles
      ENV["BUNDLE_GEMFILE"] ||= ""
      ENV["RUBYGEMS_GEMDEPS"] ||= ""
    RUBY
  end

  test do
    ruby_bin = libexec/"bin/ruby"
    assert_match "ruby", shell_output("#{ruby_bin} -v")
    shell_output("#{ruby_bin} -e \"RubyVM::YJIT.enable; puts RubyVM::YJIT.enabled?\"")
    shell_output("#{ruby_bin} -e \"require 'sqlite3'; puts 'ok'\"")
    shell_output("#{ruby_bin} -e \"require 'oj'; puts 'ok'\"")
  end
end

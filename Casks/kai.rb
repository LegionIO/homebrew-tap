cask "kai" do
  version "1.0.268"
  sha256 "106af3f2aaa93d326f1faa090f0e3382d8573cadd6da01d6c2b58e0a724add61"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

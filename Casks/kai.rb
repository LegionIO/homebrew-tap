cask "kai" do
  version "1.0.196"
  sha256 "bccb8bffdba24848da9c760a93f30ee8186a0c4c1d1208c250f527a5f6d3df21"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

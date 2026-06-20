cask "kai" do
  version "1.0.107"
  sha256 "a2a61f866ba8c6f6f381f97eba34ef0073f3e0e1c085d88381dc37bf5986924b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.55"
  sha256 "6057ad95a7400e9626015d7cfec9afef721ceb73ef5df2b4e8707b40ddf95a85"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

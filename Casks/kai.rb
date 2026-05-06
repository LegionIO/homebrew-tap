cask "kai" do
  version "1.0.65"
  sha256 "bc47ce173e25e0cfc53d4e15193ccb0ab859cbc61053eea7c3b82dd2ee01ad58"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.234"
  sha256 "f42af3b5d0a8093ba77352bbf21e404de2abfa621b48e03f2ff4018b6e3095f5"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

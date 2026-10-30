cask "kai" do
  version "1.0.253"
  sha256 "5030b0c075493adeaca2ea22e1651115d53d4b25a857563dfd812d7d1336cab0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.233"
  sha256 "16683194d55efab1bb38f55f43021543e6ebbe10d928e9c05b578baca740c4d2"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

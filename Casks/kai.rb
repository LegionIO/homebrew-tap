cask "kai" do
  version "1.0.266"
  sha256 "31796d794ac57507a7bc96756c71069e1247899c98ee1b5746d7af5b6ed13831"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

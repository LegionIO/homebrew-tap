cask "kai" do
  version "1.0.180"
  sha256 "ae26f6e31e83a8526c9ffea4b864e60e6d2a532dc4185dc5427f0ac34cf1ca83"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

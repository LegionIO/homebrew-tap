cask "kai" do
  version "1.0.211"
  sha256 "2bfccd3d84efc16cec1a275b6b2163f22e61ce0b8a655dfb5d17aecceb89a7e2"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

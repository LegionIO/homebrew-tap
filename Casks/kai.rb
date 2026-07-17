cask "kai" do
  version "1.0.179"
  sha256 "7a777d82243ce51f01cb887fc1bedba90b5a0820281b325083509a020ece52d9"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

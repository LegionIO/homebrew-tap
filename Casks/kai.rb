cask "kai" do
  version "1.0.58"
  sha256 "072582d6038d4236fa91c915989b1befa90cdbbd9662e0b88e7c28d7cc782690"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

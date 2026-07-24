cask "kai" do
  version "1.0.209"
  sha256 "7a007e0b168f2471bde1c7e80ef4c04512e3c94b23350ed2c918c94e57d8fd41"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

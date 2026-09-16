cask "kai" do
  version "1.0.246"
  sha256 "5788668f9d22cf4ae13f30deb95042756db4956d64452f897dc0e428b13bdf6d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

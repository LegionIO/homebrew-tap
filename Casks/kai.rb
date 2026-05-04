cask "kai" do
  version "1.0.64"
  sha256 "958fdc0d9129c1f7b726b96b68538f208bc330a214236310bb031953a55e2e0d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

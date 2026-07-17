cask "kai" do
  version "1.0.176"
  sha256 "a9ff134fae44bf6e20e05be2a01396be9ba3953c7805d4f4379e9676ff7fec83"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.153"
  sha256 "4e4c614346823c7cc93ec9409c8f92167436ee50a914a61ed197060a05620904"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

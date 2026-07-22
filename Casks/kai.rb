cask "kai" do
  version "1.0.202"
  sha256 "ca65dbd99ec624b49c3251178802e6451000b7c28bdc9ae4b9a029d2b1de2123"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

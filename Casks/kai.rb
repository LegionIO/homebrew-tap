cask "kai" do
  version "1.0.210"
  sha256 "2063d0773d2ab0257a53ad57cc32d96c141a8627bfe682993515b5f1156c89cd"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

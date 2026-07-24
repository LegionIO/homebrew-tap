cask "kai" do
  version "1.0.220"
  sha256 "5545964e169e956706045f3745d72f1bf97dfe4813d4cd50a30fb26bd708de19"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

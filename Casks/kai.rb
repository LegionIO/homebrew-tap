cask "kai" do
  version "1.0.249"
  sha256 "97b483649439915ceb5cdeb020d2ca45f73a0c47eb61b6dfe0cd1227dd6dfe7c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

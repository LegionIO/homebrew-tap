cask "kai" do
  version "1.0.113"
  sha256 "4a9ad4b33cdea1d6cc87392a27b853b7b1e05b6443f3a3403d229e65f11b7035"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

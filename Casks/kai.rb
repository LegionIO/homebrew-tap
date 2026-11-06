cask "kai" do
  version "1.0.256"
  sha256 "29ddd7e88d2167d2ae4392b32f5de34b249abd09ce020c58f9c35d572d87f688"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

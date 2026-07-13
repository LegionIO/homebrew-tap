cask "kai" do
  version "1.0.140"
  sha256 "83068d8176f4fde09d31383ee77cd6a8c42aceadcda5cb4c2dcfd2fe1158e599"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

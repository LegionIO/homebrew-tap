cask "kai" do
  version "1.0.42"
  sha256 "281c4f2d4c4b4b2232c0f9e185751fa206b652434b7fbfc7de1a512685d2bf52"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

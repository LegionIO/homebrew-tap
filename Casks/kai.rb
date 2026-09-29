cask "kai" do
  version "1.0.251"
  sha256 "2612ad5bcb621e9b8d0a0f63c3837a1cadb843e75d3ad6dca50a84695545176b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

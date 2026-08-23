cask "kai" do
  version "1.0.231"
  sha256 "9855e0aef103d8d8c6c39d52fe5e76fda031216bbe8bc3f6fe88aff000ec3d1e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

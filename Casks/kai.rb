cask "kai" do
  version "1.0.193"
  sha256 "774e7eb2866c015706b375c3452d3ed1e3d5f3689328ea29e01b952ed64606a1"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

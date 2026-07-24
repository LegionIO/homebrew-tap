cask "kai" do
  version "1.0.206"
  sha256 "4ed8ce37ca29cb13cfe6e6109f2ff58f1026c37fed3d442398eb2cf10c3fe7bd"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

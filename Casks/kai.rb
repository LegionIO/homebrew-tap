cask "kai" do
  version "1.0.146"
  sha256 "ea17fece5e3eb2e298dbd1c738857c15d90a5c1fb2ceae942591220fbb33172c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

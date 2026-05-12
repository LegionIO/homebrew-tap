cask "kai" do
  version "1.0.75"
  sha256 "e5194f3ddd6d1c89684fca5788935a2c29d821ee986b673a9e8153d05ba04645"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

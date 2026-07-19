cask "kai" do
  version "1.0.184"
  sha256 "8a21524f622321c4db63cb19f7a37c77cf291b0bc85ad140edc77017d26c7e90"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.239"
  sha256 "be16a196004aa07a7ae008a80cb0ab98919e16c160d4a214f6301dd8c0da423b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

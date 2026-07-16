cask "kai" do
  version "1.0.169"
  sha256 "af5ec961bf188071fa855957da4affacd766b7bca0baf6a3b1f525d9be59bf33"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

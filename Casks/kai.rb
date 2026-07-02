cask "kai" do
  version "1.0.120"
  sha256 "17424675321a3f429fcde3ce703441620ddc56017ef3f4b62d9ed84293eac4f8"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

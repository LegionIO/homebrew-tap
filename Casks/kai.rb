cask "kai" do
  version "1.0.264"
  sha256 "44b9124b95ed986c789da007df00223fe2ad47dd617b6e1c3c5d257a27f058bc"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

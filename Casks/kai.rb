cask "kai" do
  version "1.0.226"
  sha256 "e1423241afd4a80c56154c11e4510fff05b9e1a0e12ab0b79b18348fb4852713"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

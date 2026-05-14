cask "kai" do
  version "1.0.78"
  sha256 "6cdcbb6dd3f4aea2bab4dd62d22b00b81fbe8da775e8df087b142afc8156e6d5"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

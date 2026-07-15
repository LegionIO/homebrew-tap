cask "kai" do
  version "1.0.167"
  sha256 "362795086d1ea1cb32c6bd7878401b3f5c6637f200e82e04e60987ec6f775839"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

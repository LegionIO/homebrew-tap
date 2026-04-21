cask "kai" do
  version "1.0.49"
  sha256 "2827b06f09f593092ea6c57acb577ee5fa7799dec7b3e2b467de97e5623f6a8b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

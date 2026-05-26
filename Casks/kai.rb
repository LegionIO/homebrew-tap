cask "kai" do
  version "1.0.87"
  sha256 "58450489f4ed4cb73f12fa8892ee836884decbf2906fbf0913a92050c8244639"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

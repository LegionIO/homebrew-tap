cask "kai" do
  version "1.0.166"
  sha256 "66e24d2150a749ee8484e9beba87d8e7d0df631c6af78d54a636766fbc46b9a7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

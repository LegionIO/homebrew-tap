cask "kai" do
  version "1.0.136"
  sha256 "027812c897db2134c4bfb3253ce4c39a0cb9152d312558c009db7b542627749e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

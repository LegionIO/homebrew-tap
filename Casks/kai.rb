cask "kai" do
  version "1.0.240"
  sha256 "098bdc9153e99de97d136f6b116bebd3ec52b7c9ac1ec7fe43278ded8546347c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

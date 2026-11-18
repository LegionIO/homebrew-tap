cask "kai" do
  version "1.0.265"
  sha256 "d2fef6359137e13809fd3d103e787dd69ebaeb838c6ba9988acd8e7e72a57b8e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

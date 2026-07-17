cask "kai" do
  version "1.0.178"
  sha256 "a6b425e1073494b233b1becd3ce9d5604cf5bc2d7ab48fde735542584b907053"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

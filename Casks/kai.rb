cask "kai" do
  version "1.0.86"
  sha256 "9477cef4bcb685346f142fadaaba1bcfe7aa65d0356f38482f2a865e3e28ed8c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

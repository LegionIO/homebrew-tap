cask "kai" do
  version "1.0.51"
  sha256 "cc5816997228f939f70135a9133a4b3e594010007626fcbdcef49fb64b7f77bf"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

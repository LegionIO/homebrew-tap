cask "kai" do
  version "1.0.225"
  sha256 "236c81d9bcc5e420c3fbde117112a03007151811d2b254cd25186457fe42f7a1"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

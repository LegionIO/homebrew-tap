cask "kai" do
  version "1.0.245"
  sha256 "b3d1bed6272488f693f3845bed0fc87eef5b017795ed1a2ecddfc571bb0f5a8d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

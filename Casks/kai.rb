cask "kai" do
  version "1.0.115"
  sha256 "45aa5da827a5b8832300125f4642551dabcf057fc49f6bcd236ea19c1c881912"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.77"
  sha256 "8c767e952ea9d1296988e17653cb6947247f9366b64a1ff90c5dda5a3ca001e2"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

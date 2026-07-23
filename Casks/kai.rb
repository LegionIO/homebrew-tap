cask "kai" do
  version "1.0.204"
  sha256 "89b38906eafd71ea1e3c8140e3360de6b907b5bb1be45f8cd9b8c43d8029f6a9"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.46"
  sha256 "b3b2c84cabe6e8c6cabfc967f185c82a191a21b8208091ab5bcfc41aae6d7430"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

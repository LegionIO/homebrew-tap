cask "kai" do
  version "1.0.257"
  sha256 "48e00d475fb6ebd410cda5b115cd0abf253bb4e1ce258bfaec01e6976e200a53"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

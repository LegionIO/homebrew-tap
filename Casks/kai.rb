cask "kai" do
  version "1.0.40"
  sha256 "e97305ace54cc7acfc6e5de661c2ff733ed4a06ff4f306100174cd211b01f8d8"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

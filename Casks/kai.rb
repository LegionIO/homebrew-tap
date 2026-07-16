cask "kai" do
  version "1.0.172"
  sha256 "68d66bbebd3a1186880fc1f7da60c5f2d92f558add4088b807671ba94d524581"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

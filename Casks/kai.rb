cask "kai" do
  version "1.0.126"
  sha256 "37c54454c43df9e6c5c0cbfa5630abd590fd05178341939a49a2d903ed8445bf"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.41"
  sha256 "bd8d22f62b1840df43b1195536b144ce9c84f23030cab5aeed5d31fdd1134331"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

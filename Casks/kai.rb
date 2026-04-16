cask "kai" do
  version "1.0.38"
  sha256 "d676d3234635fd158e6b29398e1935b559c78a4d9a962ea308276fac73653ead"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

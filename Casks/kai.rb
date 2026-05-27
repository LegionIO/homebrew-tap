cask "kai" do
  version "1.0.91"
  sha256 "7425b70af86af81d4a768030948315885b39c100270421300e12ebc4d8c42425"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

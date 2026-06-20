cask "kai" do
  version "1.0.104"
  sha256 "e733ff5e1be194ee357b9ec719cdea46f4ff7a7eb468e395514d286a8daccca9"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

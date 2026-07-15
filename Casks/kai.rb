cask "kai" do
  version "1.0.165"
  sha256 "d3ebc4547f3c6cbf73b00dbc8c4c2085efef06366b84f6cc6f949c091ac32b5d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.138"
  sha256 "33fdde75ffc5a659e758884f31ce8a1d2c31930e66d6e06894b6300d81b3be94"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

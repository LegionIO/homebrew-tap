cask "kai" do
  version "1.0.34"
  sha256 "66f7eb9b597b2473e0023477d0bbafe37c162011e1539c55834f6e1e9a1a86c7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.71"
  sha256 "a367b8e17c5378e48d1b3d503c73f2554b8d3c328e4fbd1afb8f67118b070140"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

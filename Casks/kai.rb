cask "kai" do
  version "1.0.62"
  sha256 "9af5eacced18cafb0e4908586ab01c98dc7fb6a00337dfa9fe0e04f6aa6490fc"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

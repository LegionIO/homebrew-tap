cask "kai" do
  version "1.0.141"
  sha256 "769974088a316031339ba53f986cd3032b0508c5f86e088fa18c25f406bc8898"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

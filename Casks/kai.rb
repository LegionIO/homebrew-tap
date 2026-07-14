cask "kai" do
  version "1.0.144"
  sha256 "bde0d340472cc612e7d01b0c4d17ef53b640d8e4067716c52d6871be9ebc575d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

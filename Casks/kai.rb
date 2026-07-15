cask "kai" do
  version "1.0.159"
  sha256 "099f1fecb86747f592a0b67b72d24fb82674e9ab88db544e532568564476f9dd"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

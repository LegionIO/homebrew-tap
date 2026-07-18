cask "kai" do
  version "1.0.183"
  sha256 "9bc426cf91756bbd12657f5eb8008053e8754d1c645ccd49230ccb7b5fe39482"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

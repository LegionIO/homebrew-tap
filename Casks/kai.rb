cask "kai" do
  version "1.0.54"
  sha256 "2bbaaf731d6b78e6bcba93f9b5c99091d9a7912d310b612cee6e7fca4b2b5832"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

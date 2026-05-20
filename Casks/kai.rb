cask "kai" do
  version "1.0.83"
  sha256 "3d0ca98209e608b95bf06e5a9707ada4656be983aac4cf0996e27add99343a42"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

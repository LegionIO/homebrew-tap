cask "kai" do
  version "1.0.244"
  sha256 "7451d6c8de33b1dd1426f5fc4d281d18c6cb2b9c573513c904dfb82b039a8f5b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.254"
  sha256 "c03a262622ddc5dcd4abaea544166bde13eddb7d6a3d9b355779300f98419a65"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

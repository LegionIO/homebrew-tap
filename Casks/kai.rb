cask "kai" do
  version "1.0.191"
  sha256 "c4985a09df34e4e7e93631c13a9f5ee14cc1887a3640f827f7565f558ed2386d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

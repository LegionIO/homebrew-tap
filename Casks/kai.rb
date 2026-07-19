cask "kai" do
  version "1.0.185"
  sha256 "da07b1599de3305d7eb8bf218da6c53d82d232de25274fa9a7479192e74583cb"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.130"
  sha256 "48fbd01e75fd3194d442c3132ce659c6af485406917acb975111347d93f01f86"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

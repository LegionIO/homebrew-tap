cask "kai" do
  version "1.0.60"
  sha256 "ccbad22d17384df096fdd591faf57786dc0ae76a63ada3feaa8fa54987c93244"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

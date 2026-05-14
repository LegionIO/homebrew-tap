cask "kai" do
  version "1.0.79"
  sha256 "b606e0eaa4bdb234582e19e440a730f26a8c2c71019f94c579d7e88dc6bd12a6"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

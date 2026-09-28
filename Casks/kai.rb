cask "kai" do
  version "1.0.250"
  sha256 "2ba0debb8d83cd495a2e2a63f597ec4d4df964a79ab8df0f1429702bf3b62b2b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

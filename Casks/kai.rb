cask "kai" do
  version "1.0.123"
  sha256 "877f76f267cef7a9ddf14925ed8e4638eb8f6753ff92de5ed728f7de0579dd1c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

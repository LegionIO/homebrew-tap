cask "kai" do
  version "1.0.242"
  sha256 "2b77f280a1dacb4239ab46f91f26880ed6bb387338cac42f6e35d4f176f2dc30"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

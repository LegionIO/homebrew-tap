cask "kai" do
  version "1.0.73"
  sha256 "b9d12bdedf2c16be671bca299546293a777f1f2f171a2d85234e75ad2e66899e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

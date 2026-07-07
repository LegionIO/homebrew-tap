cask "kai" do
  version "1.0.129"
  sha256 "6f1b84ce4fc6369a67676733708b84b96313ece037a858e26c77f1f9bc0b28d4"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.53"
  sha256 "7a2f0e5bd7e647876ab9f720ac1017cb1802864c0c345970360ebc4a4e7b2e7c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

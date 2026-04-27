cask "kai" do
  version "1.0.57"
  sha256 "f65d4473ecb28fbe27a83f520f1d0d86427bc03aff890a5055e6e73f259b4958"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

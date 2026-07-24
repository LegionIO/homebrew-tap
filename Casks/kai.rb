cask "kai" do
  version "1.0.214"
  sha256 "a8b819f77fdf1a7927605d8765ca151edbd92f31bd928fe5a2ed7f75f6ba10cf"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

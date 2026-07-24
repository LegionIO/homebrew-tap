cask "kai" do
  version "1.0.215"
  sha256 "b3b6ccb1ae03ad400784602950953df041422db0605f0a42879a686789ada82d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.217"
  sha256 "3311442351eb442019b14518148b9a6752ee42bfd422b650a768712ba7c6e444"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.93"
  sha256 "eed88ba354660881547a1570a3a3ed0ed02e8d88c80a087f97affef90af53cc6"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

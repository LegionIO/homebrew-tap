cask "kai" do
  version "1.0.197"
  sha256 "ae69f5d7e6b7aa2a786d035a945d4b1d678484bf0a7e9ef6af5a070b4df38ee0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

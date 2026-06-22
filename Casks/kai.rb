cask "kai" do
  version "1.0.112"
  sha256 "999292c5891ae9a48eddeeb870f0df5fe4959a03e8055ce5e79483ae47da3330"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.103"
  sha256 "574a11d27182741a70eeabfc195bc8f366a0eb83dd2f9ac6c75154a9920c747d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

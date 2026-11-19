cask "kai" do
  version "1.0.270"
  sha256 "a97799429bf4787dea4377440964f0be1e27ca01fef19443378728365d72656b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

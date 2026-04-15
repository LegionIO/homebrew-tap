cask "kai" do
  version "1.0.32"
  sha256 "ad70bbf98c244f384a5cdf0dbdca6f32cf8080dbc4e5209e9d6bd9a86633df44"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

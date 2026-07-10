cask "kai" do
  version "1.0.131"
  sha256 "db762056ff7802bc2fe0506e01808cb981ebab7b75a71779c7d6a83260f25a11"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

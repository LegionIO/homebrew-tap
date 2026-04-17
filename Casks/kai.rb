cask "kai" do
  version "1.0.44"
  sha256 "a896e0f7762a310fc6105ad5ceb619572ddc3336aaf642c09a3b2496571994af"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

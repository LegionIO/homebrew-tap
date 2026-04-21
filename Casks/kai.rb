cask "kai" do
  version "1.0.48"
  sha256 "efd5493f83451328259321ce1e5e44384386c0608a3d4bab7645ab767bbfb897"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

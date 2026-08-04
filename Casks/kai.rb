cask "kai" do
  version "1.0.227"
  sha256 "0b563270be371e07c111dae440a8743f63a805d69b440383a32a0d65658ae386"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.163"
  sha256 "525d9a6a05aa854fa8520bce85d2f24d972f078dd5969dce81e9c615e4fd1f2d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

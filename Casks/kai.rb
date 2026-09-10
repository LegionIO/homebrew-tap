cask "kai" do
  version "1.0.241"
  sha256 "5522834aaf47206c31ca79be9c9213ed54b2cc007d945f82f370d42a1f4db29c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

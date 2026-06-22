cask "kai" do
  version "1.0.111"
  sha256 "897f676fb0d610579209c97c23a7c26480cc7cf36766e2eda3deb9c199b13022"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

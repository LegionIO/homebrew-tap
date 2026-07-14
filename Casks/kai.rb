cask "kai" do
  version "1.0.157"
  sha256 "f5861dbd61343c7992c72e450b81ff1b5f59f51c50c0c20f9794aa4a5a275a43"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

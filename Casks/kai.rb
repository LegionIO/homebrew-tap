cask "kai" do
  version "1.0.139"
  sha256 "d7c1c0b683f926c1548cfb244897bf880c15485041586d483a6db6df6faec4de"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.110"
  sha256 "bdc22730eec9761ca9da6f513cd7f1f12ae5d5393b006b5ac59c223f8026bb48"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

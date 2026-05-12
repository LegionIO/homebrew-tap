cask "kai" do
  version "1.0.74"
  sha256 "6c7d29832eda82c2e12143a28f26520ca9f7b1be3fc7069cdab168a551bbacfb"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

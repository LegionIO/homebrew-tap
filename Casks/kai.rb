cask "kai" do
  version "1.0.81"
  sha256 "b5e0f6de413c1d255c7669b1f28a94b0f0a34752447ee401baaebecc4cf2ef37"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

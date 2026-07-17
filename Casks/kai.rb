cask "kai" do
  version "1.0.181"
  sha256 "baa5c87baffbe6366f0f994faaf05e222c53383220c9d1ff1d120d9ced0d48ab"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.156"
  sha256 "bb55e20c8cb403b21e71b577859d9332fc3fa3fcab860080c3f105c5162b4ddd"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

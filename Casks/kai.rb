cask "kai" do
  version "1.0.235"
  sha256 "18e9cef94c8ee3e7bca5fd53462efde738d06a3d1f26b4eaa9c1eb055313dfd6"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

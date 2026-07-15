cask "kai" do
  version "1.0.162"
  sha256 "a723e4268efc3a1b04882ee2cffd18421462fbd198c55e3737fef6f967da1051"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

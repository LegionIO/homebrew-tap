cask "kai" do
  version "1.0.212"
  sha256 "49ef8801b9aa8cd5f8826131bcbb55574673f58fac6a01fea2d452b9f61eb001"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

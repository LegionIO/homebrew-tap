cask "kai" do
  version "1.0.174"
  sha256 "56a6892b0c40a54492ba6d8231494349d090a7fd9cd1d14a56427f9ac0cd776a"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

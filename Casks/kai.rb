cask "kai" do
  version "1.0.221"
  sha256 "bb137087d755a2971e442c8012f1449ee965eb06498fe82e1f259990ad93a560"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

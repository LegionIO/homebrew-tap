cask "kai" do
  version "1.0.248"
  sha256 "7b73f98f1f99de6017458cf7cabd1dce0c19c41bddb012e6fbba1073a2e79deb"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

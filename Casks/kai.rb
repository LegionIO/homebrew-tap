cask "kai" do
  version "1.0.229"
  sha256 "b680ab3f755d2b1c527f8cd2db8c9672764d1bd6c213f3ce7e13f24137d4b998"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

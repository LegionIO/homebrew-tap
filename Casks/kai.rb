cask "kai" do
  version "1.0.188"
  sha256 "9e3e055f588f43f646c68ead27eb5c914fd1b3073734419d15c3bd07eda91039"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

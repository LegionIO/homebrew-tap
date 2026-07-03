cask "kai" do
  version "1.0.121"
  sha256 "8dc6fbaf18448bfcd2a7fae16e0c99f92916e6ed2970cc78493097cf214348b3"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

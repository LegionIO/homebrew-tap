cask "kai" do
  version "1.0.94"
  sha256 "5b042756b61ef2c74dedb37fac339ed5b58ec17cc175ab121f28cf8e8dbe3bea"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

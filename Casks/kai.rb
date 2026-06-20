cask "kai" do
  version "1.0.102"
  sha256 "6c64bdab09c62ff1d2748f7aeed2f8de2ef7c1948361be1df01708ebe4295c48"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

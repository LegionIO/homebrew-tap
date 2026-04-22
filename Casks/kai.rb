cask "kai" do
  version "1.0.56"
  sha256 "8ea27a9bc0588880b9943bada37a8f6de88140b081fd01fd4499922bbb7af67f"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

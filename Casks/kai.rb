cask "kai" do
  version "1.0.100"
  sha256 "64fe9eedfa0812c6ce844a66eed2996c7f39548d8ffd825fcab647ced8882b2f"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

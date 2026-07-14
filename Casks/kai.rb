cask "kai" do
  version "1.0.152"
  sha256 "05513d147e81fc05de9b04f3e78e565df1c48cd9c2986ee3b99c81726ef8557a"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

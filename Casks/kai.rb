cask "kai" do
  version "1.0.155"
  sha256 "0ca8b9d0e769b60d71a834314448e0c717e6203731a1fa3537daf8981bdd0ce7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

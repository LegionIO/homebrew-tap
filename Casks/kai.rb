cask "kai" do
  version "1.0.59"
  sha256 "a7039510621cb7c560e2935192b39c03f2ede875a0915479a3c75f3c1367586f"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

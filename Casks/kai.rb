cask "kai" do
  version "1.0.119"
  sha256 "f35a966e4d2a2fba8c3e30312f51939295906e3a12918c76f5819acb2de5cf36"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.35"
  sha256 "35cfb4d535a45fac9fcae8bc14bb660cb4350ef301deb0f83d9e81d31a0f7204"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

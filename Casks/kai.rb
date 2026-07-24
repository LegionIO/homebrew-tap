cask "kai" do
  version "1.0.208"
  sha256 "c83c15ed57ba6d119bee532a041e91316f83e8dc40eb6c2b76619fec4eb10c29"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

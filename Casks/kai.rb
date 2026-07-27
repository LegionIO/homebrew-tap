cask "kai" do
  version "1.0.222"
  sha256 "8cf30807fd58aadbeaa083c884ebd125f48f14cd04eceba8961aba8aefaf209c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

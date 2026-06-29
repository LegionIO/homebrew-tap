cask "kai" do
  version "1.0.118"
  sha256 "0e81aae7ac7e27391c45686682dcd2f1b728dcb6a9e7d6f022f8bb82c23e88e5"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

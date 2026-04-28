cask "kai" do
  version "1.0.61"
  sha256 "50c81444b2be8d04bb229a21f2a9882ff7a76b86bf2ec2bfb1ad4d01a75e8741"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

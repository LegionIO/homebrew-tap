cask "kai" do
  version "1.0.199"
  sha256 "d7ad3e6e8b782c2834e37e0577349320f4dc2f6ec2efbcbcc3a0b8ffd2243926"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

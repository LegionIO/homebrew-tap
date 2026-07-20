cask "kai" do
  version "1.0.192"
  sha256 "c51ae3d4eea19ec99b91ad9c03b911cc1cf17b5b81c815864abcc822e0bf628b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

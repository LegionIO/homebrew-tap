cask "kai" do
  version "1.0.194"
  sha256 "cc67b9d4b963faf42f36960bc460cf2523e94c3e7d8fe99d10880b9000daf797"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

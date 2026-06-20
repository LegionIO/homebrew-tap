cask "kai" do
  version "1.0.101"
  sha256 "2991ca24e0b0e98a3f2fa5cb1e50baa428f13eb449f6b0253e577c8d9d177e3a"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

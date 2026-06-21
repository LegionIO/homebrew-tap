cask "kai" do
  version "1.0.108"
  sha256 "ab46601663742cedb3718749d00b80138c5f0a611155f91e6bb1dda7e1e45236"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

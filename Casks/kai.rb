cask "kai" do
  version "1.0.219"
  sha256 "3e6b0dcf16301820ad83f4bd99113505ab1b2813fc3e4b0702d1a446a3bd1ce0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

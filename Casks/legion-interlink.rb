cask "legion-interlink" do
  version "1.1.7"
  sha256 "b38a6af801aa2810a39c623398887d6c0e7c40cc3e5318b19cef4077d874ae7e"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.7-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.1.25"
  sha256 "b99745053d210f325ef6a95680462bc799476d26a88600a73ca3c4a9625c15bd"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.25-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

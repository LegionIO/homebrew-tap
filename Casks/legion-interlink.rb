cask "legion-interlink" do
  version "1.0.28"
  sha256 "4c4951d3373d329a318919aa722c22bb7307cfb065bed54deb26a567ef679ca1"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.28-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

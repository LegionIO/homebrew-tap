cask "legion-interlink" do
  version "1.0.29"
  sha256 "31407659885a84c29a89de554e36b6839b9e06378e555f618ed4f761b8a20114"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.29-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

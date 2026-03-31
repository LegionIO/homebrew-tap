cask "legion-interlink" do
  version "1.0.11"
  sha256 "8fa9fd9debf129d7ddd12c3886b889ce1351d8c07e87c9fb2a38f4a5ccc4518e"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.11-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

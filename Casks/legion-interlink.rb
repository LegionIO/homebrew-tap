cask "legion-interlink" do
  version "1.0.17"
  sha256 "cff5ec3890f0f363030a02c7d72bbcc2f4b05ddd96e21d8a0c3c558ff460ef0a"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.17-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

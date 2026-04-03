cask "legion-interlink" do
  version "1.0.15"
  sha256 "b4aeb7df8b0acd2df8ac2cbb31c5f980e3aa3c718718975e3ac9829a498c1fdb"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.15-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.0.9"
  sha256 "e80ed017efdb71b07860237124390158e411522fde95fa104613dda0281a5c2c"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.9-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.1.1"
  sha256 "fd3104a7e837a7d1743e64ecbc198834ea1c17eb12e35ac45c2d2195301478dc"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.1-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

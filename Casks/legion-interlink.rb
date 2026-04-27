cask "legion-interlink" do
  version "1.1.21"
  sha256 "f803751ad673644a7a4d1bd61f86fd508466b215332a8cbf7e1597511eed1653"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.21-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

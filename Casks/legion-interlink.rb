cask "legion-interlink" do
  version "1.1.5"
  sha256 "bd81152e684ff9855026ed32f8afe1e2480edaf646162ab07260ac0cbca2a678"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.5-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

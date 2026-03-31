cask "legion-interlink" do
  version "1.0.13"
  sha256 "b91fd8a289962ceb9a90e6101a2044d706e2dd6dedefcf3644f7046e55d60d99"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.13-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

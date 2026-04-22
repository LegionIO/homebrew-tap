cask "legion-interlink" do
  version "1.1.6"
  sha256 "6d331ac1ace6f101df651786ffd64d9501491d174f06fa84b9b5f2020ddd19c6"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.6-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

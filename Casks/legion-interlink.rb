cask "legion-interlink" do
  version "1.1.2"
  sha256 "8cbaef0720582f795c2a2cc8e7caca78fa8dc515fd9888dd994fc46cb8c59379"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.2-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

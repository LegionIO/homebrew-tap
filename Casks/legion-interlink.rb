cask "legion-interlink" do
  version "1.0.27"
  sha256 "25f55f52f050fab87e470a6a328ebf65961d5a8aae50e14ffbf20c530ba655ac"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.27-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

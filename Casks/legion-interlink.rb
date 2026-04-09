cask "legion-interlink" do
  version "1.0.24"
  sha256 "6a0f632ecb3a32dc51418c9455859806453d93a280a32474e852ba1436a7190d"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.24-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

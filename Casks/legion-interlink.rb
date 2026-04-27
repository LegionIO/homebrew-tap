cask "legion-interlink" do
  version "1.1.14"
  sha256 "fdb2695aa54b3ce7173f8ff2f073c007a145a0596f468254a70cd1dda259ae3f"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.14-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.0.12"
  sha256 "645c7de35e06d004fc1b638a809b9ca8cfc62d65d226346ddab00668bccf6b68"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.12-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

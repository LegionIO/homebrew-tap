cask "legion-interlink" do
  version "1.1.3"
  sha256 "5dfee43351647d66a9e0c8625e88d86910100f0a516a011fc1290c25b1a953aa"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.3-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

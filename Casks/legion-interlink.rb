cask "legion-interlink" do
  version "1.0.7"
  sha256 "fab9641d6f1fa4a035a0dcac3d75a1717a0b542bd81d9ab1f1a654d62ef8b994"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.7-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.0.26"
  sha256 "9dbfa64daf6570e5d13d24c4f0143fb7eca6f8159091656efd51a5037f8998e1"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.26-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

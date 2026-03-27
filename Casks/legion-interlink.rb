cask "legion-interlink" do
  version "1.0.0"
  sha256 :no_check

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-#{version}-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  depends_on arch: :arm64

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.0.25"
  sha256 "c5e8cdaf6023399e8530bce279bd6428b562b6a4468bd5d61280aad0ee3aba72"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.25-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

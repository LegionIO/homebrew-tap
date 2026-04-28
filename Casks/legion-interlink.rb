cask "legion-interlink" do
  version "1.1.23"
  sha256 "02aa225104c89d9f7cc84311dfc9c2032c4e48324d831cd514234d24cd843267"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.23-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

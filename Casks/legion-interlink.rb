cask "legion-interlink" do
  version "1.1.4"
  sha256 "bf8a866518ae3c993e400e2199fb9a11960302020d86441dba6171e26ccc2398"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.4-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

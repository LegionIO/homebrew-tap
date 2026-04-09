cask "legion-interlink" do
  version "1.0.23"
  sha256 "a579b5fc4882132f8a806f1b83693a803fca9afb99b5ebfe52dbe666405bfe3c"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.23-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.0.22"
  sha256 "fa503fe50687e6dbb02a2b0dc1b824e2d28cc12730dccae9c8a21cd196ed49f2"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.22-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

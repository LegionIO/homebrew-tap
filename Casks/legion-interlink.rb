cask "legion-interlink" do
  version "1.0.14"
  sha256 "4a15ec7a96ac4e0b7346c19a5d45d03323808cdb8a4fde0797bdb75b09cde5aa"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.14-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

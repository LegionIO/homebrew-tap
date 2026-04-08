cask "legion-interlink" do
  version "1.0.19"
  sha256 "3cbbb9dbcf3fa930b1746a84353aeb32d8f4c4ce35ad7c20fa9ed8724332fea3"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.19-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

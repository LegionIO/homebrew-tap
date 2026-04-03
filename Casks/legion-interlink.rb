cask "legion-interlink" do
  version "1.0.16"
  sha256 "a4839f051c8b913872de07eef7f9dc5d64b43ea215905396143b93d627dff803"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.0.16-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "1.1.22"
  sha256 "1b795f103bf9c4453e3219d7127a9239370c7e6ebff2b690e2fb2d2b6d06bf6c"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-1.1.22-arm64.dmg"
  name "Legion Interlink"
  desc "LegionIO desktop client"
  homepage "https://github.com/LegionIO/legion-interlink"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

cask "legion-interlink" do
  version "2.2.4"
  sha256 "916ae0f19b0cadb6c21153eb08f52797dcefc9d6beed006fd984ed4b992ab0dc"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.2.4-universal.dmg"
  name "Legion Interlink"
  desc "LegionIO menu bar manager — bootstrap, monitor, and control the Legion stack"
  homepage "https://github.com/LegionIO/legion-interlink"

  depends_on formula: "legionio/tap/legionio"
  depends_on formula: "redis"
  depends_on formula: "memcached"
  depends_on formula: "ollama"
  depends_on macos: ">= :ventura"

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

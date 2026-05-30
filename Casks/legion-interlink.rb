cask "legion-interlink" do
  version "2.3.2"
  sha256 "31ac1f16862afc43e849c364e5655059a3343fc5705708b242f4ae2f6f61069e"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.3.2-universal.dmg"
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

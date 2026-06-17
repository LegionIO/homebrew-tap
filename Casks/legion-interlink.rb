cask "legion-interlink" do
  version "2.3.5"
  sha256 "e5f11b3f75afec14622d3241cea483db8208c25f3f35adeb64955dca42881891"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.3.5-universal.dmg"
  name "Legion Interlink"
  desc "LegionIO menu bar manager — bootstrap, monitor, and control the Legion stack"
  homepage "https://github.com/LegionIO/legion-interlink"

  depends_on formula: "legionio/tap/legionio"
  depends_on formula: "redis"
  depends_on formula: "memcached"
  depends_on formula: "ollama"
  depends_on macos: :ventura

  app "Legion Interlink.app"

  zap trash: "~/.legionio"
end

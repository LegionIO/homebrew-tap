cask "legion-interlink" do
  version "2.3.3"
  sha256 "bbedca5633a7555f8757642d029b999876de38e54be4b0792d210b382b7a3056"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.3.3-universal.dmg"
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

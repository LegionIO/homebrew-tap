cask "legion-interlink" do
  version "2.1.0"
  sha256 "b4a036b1d7f445dad4449932b3e69e9726cc4986399304ca9e185d2c297ea1ea"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.1.0-universal.dmg"
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

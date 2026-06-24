cask "legion-interlink" do
  version "2.3.6"
  sha256 "b21e22f56d329afd2e806a79d56c0fba9b76ba5625864aec6e982df2ad3dd653"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.3.6-universal.dmg"
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

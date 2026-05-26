cask "legion-interlink" do
  version "2.2.7"
  sha256 "0c501c3ebf1d84c288611fc4e4397ad95e01d8c71983b69327c97f7183bd9f72"

  url "https://github.com/LegionIO/legion-interlink/releases/download/v#{version}/Legion-Interlink-2.2.7-universal.dmg"
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

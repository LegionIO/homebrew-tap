cask "kai" do
  version "1.0.128"
  sha256 "895899551d595d4f3ee509c0a3b91a5c88ebf86dba80565e1459355d62401fb7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

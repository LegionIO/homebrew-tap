cask "kai" do
  version "1.0.50"
  sha256 "48d108f50284a3c8df79d96b79f9265f359ceee8d12d62500a6d217cde881c34"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

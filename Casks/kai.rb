cask "kai" do
  version "1.0.195"
  sha256 "b629a51bf9b57aaac182d8f19fdf8b89db34220c6383c74d2033737a2607c420"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

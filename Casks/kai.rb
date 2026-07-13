cask "kai" do
  version "1.0.135"
  sha256 "b73e93a99c5c3ed51f88255b50b765d91f06b1b0738e90c2e341a43fa17d836b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

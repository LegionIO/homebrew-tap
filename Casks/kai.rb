cask "kai" do
  version "1.0.228"
  sha256 "613ecaa92eacb56c9cc4c2a286966330c392484ac71a59d1d671db7a1dc6bfc7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

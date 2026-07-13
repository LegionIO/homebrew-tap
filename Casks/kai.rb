cask "kai" do
  version "1.0.134"
  sha256 "36c201554a5c17ddbe168db7989f75a20780e4278acd0a5cbf06a4e184e43323"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

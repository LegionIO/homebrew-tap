cask "kai" do
  version "1.0.187"
  sha256 "40327cfb608dbf7c9b2a9d3401b44baf13507c66b438dce4382f55fc89256027"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

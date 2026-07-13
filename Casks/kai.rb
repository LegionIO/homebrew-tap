cask "kai" do
  version "1.0.133"
  sha256 "7f8c044fd24ffe26479cb7289e36d72f075ac75c8e764939787fb97099c1cf17"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

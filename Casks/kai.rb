cask "kai" do
  version "1.0.69"
  sha256 "8aa246143fd4313ff0125afc7ce41a5aa52900ba6f5357499ebea699d7c3e8ea"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

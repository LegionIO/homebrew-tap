cask "kai" do
  version "1.0.164"
  sha256 "c8a6071aacca580076e5455ee6540e94e3ce17b899554f551fe4098e255e80f9"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

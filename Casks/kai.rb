cask "kai" do
  version "1.0.76"
  sha256 "4316ca5691fc088efba8190ba6b2b8e58df4adb2e211246b585c21dc7fb8d32d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

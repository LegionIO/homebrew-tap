cask "kai" do
  version "1.0.158"
  sha256 "27664564ac64d6de30d0e040de0edd098589ee8cdf845138af36acf79a448fd0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

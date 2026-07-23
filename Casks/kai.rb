cask "kai" do
  version "1.0.203"
  sha256 "0c9e3da0465c24adeacb82a2fc4f3ae532182447da8cfdf241fc769eeda8dc73"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

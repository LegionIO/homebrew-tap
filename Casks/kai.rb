cask "kai" do
  version "1.0.45"
  sha256 "b0bd59b9b822b4f57641b42043f98683f0d570d204ffd55ea875f7fc1c6394fd"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

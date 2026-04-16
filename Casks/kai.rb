cask "kai" do
  version "1.0.37"
  sha256 "ed63ee58b0fe9a6f15e5772bc10789cb74b90ee8f730bc9dc9e489b494987327"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

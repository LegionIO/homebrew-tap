cask "kai" do
  version "1.0.216"
  sha256 "149ffd51cd237db08d427564153ba48687c1ab2edfdaa2725b0916125f149860"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

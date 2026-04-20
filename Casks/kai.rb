cask "kai" do
  version "1.0.47"
  sha256 "bc9573792041aebd8b104624511ce4fb01c98c2c7c3a44cb8b28438f933d91b3"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

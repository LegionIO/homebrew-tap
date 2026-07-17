cask "kai" do
  version "1.0.182"
  sha256 "4abe9ec1e6f72d410d98ade07721e7f00b631e3b4be474df14cb0009ca714f4d"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

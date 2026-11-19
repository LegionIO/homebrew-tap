cask "kai" do
  version "1.0.267"
  sha256 "580ff70f81f16b8d758ee458d5e580b247c74a9ee0b72c586481d5a9130a0909"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

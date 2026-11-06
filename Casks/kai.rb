cask "kai" do
  version "1.0.255"
  sha256 "f9fb1fbcc543a44298ec8f7aa4e3fa940501d79215dbb816880282ee39a2f004"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

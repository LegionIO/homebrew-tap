cask "kai" do
  version "1.0.201"
  sha256 "8521e799a754408cbc208b6b060377ac385009ef9552366deb2e1491dae884f3"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

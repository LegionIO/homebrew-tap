cask "kai" do
  version "1.0.170"
  sha256 "40477c3f93f367c77ac7f0cb120ec1c81aa301abbb9b956e88d6c3b39074f192"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

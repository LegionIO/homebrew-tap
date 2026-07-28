cask "kai" do
  version "1.0.223"
  sha256 "6693d814fdba88c01056e8ec1ad26ace652a38f630ada8f7c3c98d4d3f87adef"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

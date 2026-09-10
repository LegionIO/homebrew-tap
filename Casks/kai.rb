cask "kai" do
  version "1.0.243"
  sha256 "312f6b0ccb70f695306b6f75eba1d969d51d9b41af3b72df8e7d8f7e65548e02"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

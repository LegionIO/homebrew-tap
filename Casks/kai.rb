cask "kai" do
  version "1.0.213"
  sha256 "f99748817686855e599ff9681b16a59200880cc66af565b72c07839fd884ac01"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

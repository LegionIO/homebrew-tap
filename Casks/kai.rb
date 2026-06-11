cask "kai" do
  version "1.0.96"
  sha256 "98a706854edae68e3fe2c6ce376f77b79a336e8e3cfdac4a49d4259e2d83be3f"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

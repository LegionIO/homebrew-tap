cask "kai" do
  version "1.0.171"
  sha256 "5a86f8e2e930c9a806a8475d99ee1043dd17cbb0366e383af0e63d099f7adbe1"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

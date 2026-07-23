cask "kai" do
  version "1.0.205"
  sha256 "8ee504001a03bb97915504dd8dcc5f06161848fccb226bf7b81807f3b471f7ed"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

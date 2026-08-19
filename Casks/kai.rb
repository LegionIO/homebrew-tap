cask "kai" do
  version "1.0.230"
  sha256 "8ce7a11be235f7d99efeb1bdec96831f39b93c391bfc9950e6298f97ab7a12cb"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

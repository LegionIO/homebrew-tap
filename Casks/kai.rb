cask "kai" do
  version "1.0.99"
  sha256 "055bb027f33c6e0fd4278b71a609b92e8861c58a88069f1db567d1c9e1e0e08f"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

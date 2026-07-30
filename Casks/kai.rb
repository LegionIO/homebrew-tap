cask "kai" do
  version "1.0.224"
  sha256 "66cc6eed035d39a38ba60e7976fcb2c4ad3ce56021fad55e4af50a6243f4ca76"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

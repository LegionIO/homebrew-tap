cask "kai" do
  version "1.0.70"
  sha256 "03fd5077a8479c3ed141c0ad7e3ffcff11aa29a4006145bd23f44b4b1f2d0dab"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

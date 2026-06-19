cask "kai" do
  version "1.0.98"
  sha256 "39bdcb206e7a7c9b0fb50d60dd2d9a79ee8b3aa710f1eeb24b17aab47331b6c6"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

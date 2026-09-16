cask "kai" do
  version "1.0.247"
  sha256 "628108aa1902d519b36a6223fffb430f8bcca9e583354d6bab0f36e71faf3929"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

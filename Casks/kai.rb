cask "kai" do
  version "1.0.117"
  sha256 "4d0c9818dcb7bb9c3cf54432d1064cd672fd043a5088b52f182e4e7d869cf42e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

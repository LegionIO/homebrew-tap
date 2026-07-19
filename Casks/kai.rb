cask "kai" do
  version "1.0.186"
  sha256 "d7d6a781d16d450d1211ceaba861564bf2a8e5f5e73f35cb3f30ba338afdd47c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

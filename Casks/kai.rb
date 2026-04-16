cask "kai" do
  version "1.0.33"
  sha256 "79c15ead177e6ad414b33ddda52810a0dc95b9af354058d95367897cf25f3393"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

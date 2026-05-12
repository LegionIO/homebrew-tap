cask "kai" do
  version "1.0.72"
  sha256 "edcd5f4d031e064b68ba5cc93de3f6dfb051ff78bc8e5262f264d6108acb9eae"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

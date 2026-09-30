cask "kai" do
  version "1.0.252"
  sha256 "5e5a9c182886e706cbf03b3392332a485e5fb3bc430eb311b8fa441b4b9f6950"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

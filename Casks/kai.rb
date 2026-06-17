cask "kai" do
  version "1.0.97"
  sha256 "2ea51c458eaedf5777dfe45cb7b564a7c85101253b0731f8cb0861f094de80b0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

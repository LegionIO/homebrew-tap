cask "kai" do
  version "1.0.43"
  sha256 "f6aea2316f2f799e401e2001dbfa79df22c2dd599fc978d6f2572fe9a9e7a47a"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

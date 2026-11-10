cask "kai" do
  version "1.0.260"
  sha256 "fac494d351c95ddd50a4b00e5b7678953b15cc13d4bfd520fa4fb6c312e26e55"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

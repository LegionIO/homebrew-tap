cask "kai" do
  version "1.0.66"
  sha256 "d1812c457da91270b5d1fd96aa7c4958c6eb6971de6f820b5d9881321682c0d0"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

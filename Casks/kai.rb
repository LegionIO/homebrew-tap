cask "kai" do
  version "1.0.261"
  sha256 "f90dfc08703021a51e4686cdc573d2b071344e16f19dd454d76a806cf6191a27"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

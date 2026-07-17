cask "kai" do
  version "1.0.177"
  sha256 "b50950877de9e72433d095793053788cc76b8389c0382e821edd1b626ad40ced"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

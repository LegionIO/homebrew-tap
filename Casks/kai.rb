cask "kai" do
  version "1.0.218"
  sha256 "f2898d7276943aced63914f324f27083e4422d1870db4ea27797a951a409ff12"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

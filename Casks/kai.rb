cask "kai" do
  version "1.0.116"
  sha256 "670500e1fd0ba0b8e34691b9d56c814039548b5465ad4ef6551c7335eb7e96b5"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

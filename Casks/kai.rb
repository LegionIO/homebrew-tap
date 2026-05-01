cask "kai" do
  version "1.0.63"
  sha256 "539e8c185ab2ccc48cc4a5b55695cd6a17845fbf6ff3aded0ce1fd6cdf3a5431"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

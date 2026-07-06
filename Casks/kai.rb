cask "kai" do
  version "1.0.127"
  sha256 "fefb147ed5a70b877afa341009fb1ac2891422f72e3750c009d2fdef2954d84c"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

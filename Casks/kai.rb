cask "kai" do
  version "1.0.36"
  sha256 "c868331031929881941e26b003122123d76b796ea7a1cdcca98f21ae4e908e4b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.80"
  sha256 "ed05f546c05072eec268bb8136f17df4ea1dbf16af4413d47ca21e6f07b4670b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

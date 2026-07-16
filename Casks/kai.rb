cask "kai" do
  version "1.0.175"
  sha256 "16c11dd37fc082c5d3406a56cdfaffb663fabad6b46d221cab8378e58528c362"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

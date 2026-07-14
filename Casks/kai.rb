cask "kai" do
  version "1.0.154"
  sha256 "d07abd24dc7cb6168aab877f0f8049895f65ee47669e2180f250290ddb5700b1"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

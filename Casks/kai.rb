cask "kai" do
  version "1.0.207"
  sha256 "4092126cf447c7d540a1271db1bb37cadf337adcc9aba520185ada4f0f8c9928"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.189"
  sha256 "c8884f89a19a51f290563ef3edec4ff8e76d00029e7405c252779d590a07885e"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.142"
  sha256 "285fc5dba080aeb1ae59ab5b997294d4cc8b326f3f4148739e80f4b8a75af841"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

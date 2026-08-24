cask "kai" do
  version "1.0.232"
  sha256 "2a571fe5f90c25b4032b215275daa4e6ad8f84ed2458746a130e059799752f3b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

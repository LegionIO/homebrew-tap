cask "kai" do
  version "1.0.132"
  sha256 "be449c25d49ea75c6b7f6a44f313d9cfc7206ed908dc37140b1319af8ddebf35"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

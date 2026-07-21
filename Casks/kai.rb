cask "kai" do
  version "1.0.200"
  sha256 "df8f2296ebbe5749fff7a54f7ac342bdd3adf2687c9544353f6c447cb86dfaff"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

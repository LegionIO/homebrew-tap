cask "kai" do
  version "1.0.90"
  sha256 "cac72769dada7030b47aee79560ef2827391f578c20a1fb840f46fc3aedcb6d7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

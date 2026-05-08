cask "kai" do
  version "1.0.68"
  sha256 "f6cbb793956f3a8d680a20b7f222a1874b9cad1dd22fd1b542a4da1bfd43eb33"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

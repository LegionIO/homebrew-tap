cask "kai" do
  version "1.0.122"
  sha256 "5e16016eb663a0e3131f7502dbe38db5593060bc9a3e0755e733e8654d7b4a12"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

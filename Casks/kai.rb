cask "kai" do
  version "1.0.67"
  sha256 "81892e5c227c65e121cede6d432c96c82f6c6c25c50c3a6ab46b42bb5cf611df"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

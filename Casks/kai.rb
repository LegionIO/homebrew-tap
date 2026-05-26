cask "kai" do
  version "1.0.85"
  sha256 "c7f6210ab5a2f608b93079f93713a6bc6ed73020748c1549830b65dbb78c30df"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.137"
  sha256 "c5949335c189770a30f6f3114bcc487c7b15ee228b8336ea4623db2a74ff72ce"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

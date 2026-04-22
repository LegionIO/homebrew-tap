cask "kai" do
  version "1.0.52"
  sha256 "3fba41bd51fb9f3330216ded5b6eed58273c284e2216bc8d0a2de5bcf40b1dea"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.143"
  sha256 "d06aa1c1c023eb75cc4745a89b85bbda6827c162a0792a085dcf155cd3633409"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

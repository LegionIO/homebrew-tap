cask "kai" do
  version "1.0.82"
  sha256 "a8cf5ba106921c94ba18dccb6fbd583ae6b6f851f958c7427c22c718e2bedfc7"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

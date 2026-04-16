cask "kai" do
  version "1.0.39"
  sha256 "825d29d36c18d806b9aeb11f899b0af3fe40c8890b9961f679601c4330744153"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.190"
  sha256 "09de322300c121c88a21aa8958e39dd271b7768d147dbf7678d9480ba04eaf9a"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

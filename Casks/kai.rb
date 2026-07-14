cask "kai" do
  version "1.0.150"
  sha256 "7a008ca90a07c5dcbd671da066de9c95cad4ca76ffd8381ce8e2cfce45ae7574"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

cask "kai" do
  version "1.0.124"
  sha256 "fdf398bd15b6851409d74238436162ce8174aa73538a654e23aded252414c6cc"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

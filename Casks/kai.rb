cask "kai" do
  version "1.0.84"
  sha256 "ff89bf0f3860cb45ce740e31596374b255e01878c62f9e1809a8e2a052e2899b"

  url "https://github.com/LegionIO/kai-desktop/releases/download/v#{version}/Kai.dmg"
  name "Kai"
  desc "Kai desktop client"
  homepage "https://github.com/LegionIO/kai-desktop"

  app "Kai.app"

  zap trash: "~/.kai"
end

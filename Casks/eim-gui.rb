cask "eim-gui" do
  version "v0.5.1-test"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-gui-macos-x64.dmg"
    sha256 "4a91ca6a0b229b20a9130a1432bd6719f6b2c1d23ea0d9cc9a66f43c2d2cf962"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-gui-macos-aarch64.dmg"
    sha256 "2a4739d22723e42ad8ec333e160c09bec6c2e67018ce5c187d35a648cedbd645"
  end

  name "ESP-IDF Installer and Manager"
  desc "GUI application for managing ESP-IDF installations"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  zap trash: [
    "~/Library/Application Support/eim",
    "~/Library/Caches/eim",
    "~/Library/Preferences/com.espressif.eim.plist",
  ]
end

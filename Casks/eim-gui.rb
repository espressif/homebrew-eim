cask "eim-gui" do
  version "v0.5.3"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.3/eim-gui-macos-x64.dmg"
    sha256 "8f357b43f3fea4310656f99d23b9fd5f01897b6b6bda0ab5b7a8145adf0a69d3"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.3/eim-gui-macos-aarch64.dmg"
    sha256 "8b6d6c98ec572abf34059a590b5a0659906b2e10251f4c2cfa0698d6d6f7893b"
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

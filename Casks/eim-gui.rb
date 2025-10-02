cask "eim-gui" do
  version "v0.5.2"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-gui-macos-x64.dmg"
    sha256 "1449252b20d25212193708405cd45873be7360b5cd93956796978863989d41a3"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-gui-macos-aarch64.dmg"
    sha256 "5639dd39fbd5d54ef6159e0f23fa77e22c259fced0e69a450dd972704b58bb53"
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

cask "eim-gui" do
  version "v0.5.2"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-gui-macos-x64.dmg"
    sha256 "eb773b83cb01e742179c87a81836b4dce90af1ba1609c4d4c2c63654d2b4ac67"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-gui-macos-aarch64.dmg"
    sha256 "31447900d9ce44cb2548a4dad54de1902d30ccd208310d85ff679bef9212e7dd"
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

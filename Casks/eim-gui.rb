cask "eim-gui" do
  version "v0.5.5"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.5/eim-gui-macos-x64.dmg"
    sha256 "b6b32df143a156c02176a603762bb6be3625f9f1ae944c5c0ae3dc37e7d7c69c"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.5/eim-gui-macos-aarch64.dmg"
    sha256 "737807e7ce490a7eb44f304b67e33ca7aad12bb7566370426483257634ac77eb"
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

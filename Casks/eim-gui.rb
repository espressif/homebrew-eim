cask "eim-gui" do
  version "v0.5.1-test"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-gui-macos-x64.dmg"
    sha256 "824bbcd4d8be0b49086d2155593a3d68f406783abfbf3bc9c26f55a829ebefee"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-gui-macos-aarch64.dmg"
    sha256 "0f8ad8b70100b49afefa5d5453804c222bf05a85585388fa070c21f4b772a6fe"
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

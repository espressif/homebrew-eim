cask "eim-gui" do
  version "v0.5.4"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.4/eim-gui-macos-x64.dmg"
    sha256 "11779ed1a7a1190b5ffd81eaf88e99a999495e214614596d28ab129f993de73f"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.4/eim-gui-macos-aarch64.dmg"
    sha256 "6155fc1d3dbcb2511a0f5a65f730269170371eb7ec710edda66104bed1a71dc8"
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

cask "eim-gui" do
  version "v0.5.1-test-release"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-gui-macos-x64.dmg"
    sha256 "5b7ef1b690aa429f18415bd5de5abbb8460687baf1e0c55a43963ebfa85aed05"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-gui-macos-aarch64.dmg"
    sha256 "d7fcd490434417bf16641c9f957f7717f26522074735782260b49d7e7ec51ef1"
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

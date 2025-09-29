cask "eim-gui" do
  version "v0.5.1-test-release"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-gui-macos-x64.dmg"
    sha256 "f88ddefef7074fbb33470781b4be835dccace498a4879ff900768a043eb34251"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-gui-macos-aarch64.dmg"
    sha256 "9e4af507d74906166c179266059bb1c724bbc837ff406f0e6d4416aabff885ac"
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

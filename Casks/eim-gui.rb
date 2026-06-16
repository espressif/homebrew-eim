cask "eim-gui" do
  version "0.14.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-gui-macos-x64.dmg"
    sha256 "973372ee0fe1c24c1a84813e720c6884416d4873bec56ab3ca727a36939323ef"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-gui-macos-aarch64.dmg"
    sha256 "6082dbdb0e0c214f06f8f1e8ef8b1b4cdc83c358bd30678b6be3cbf40f9f0db0"
  end

  name "ESP-IDF Installation Manager"
  desc "GUI application for installing and managing ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  caveats <<~EOS
    ESP-IDF Installation Manager (EIM) has been installed.

    IMPORTANT: ESP-IDF requires Python 3.9, 3.10, 3.11, 3.12, 3.13 or 3.14.

    If you don't have a compatible Python version, install one with:
      brew install python

    For QEMU emulation support, you may also need:
      brew install libgcrypt glib pixman sdl2 libslirp dfu-util
  EOS

  zap trash: [
    "~/Library/Application Support/com.espressif.eim",
    "~/Library/Caches/com.espressif.eim",
    "~/Library/Preferences/com.espressif.eim.plist",
    "~/Library/Saved Application State/com.espressif.eim.savedState",
  ]
end

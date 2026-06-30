cask "eim-gui" do
  version "0.16.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-gui-macos-x64.dmg"
    sha256 "8a7d2bfc15de059d7a642bc55d134e43de745a6c1040241154e4fcb922a00e16"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-gui-macos-aarch64.dmg"
    sha256 "f45b412440a01ade26680fdc39fbd994d51d561921b7b5bb07d776031a44ebb3"
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

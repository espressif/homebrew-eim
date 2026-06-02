cask "eim-gui" do
  version "0.13.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-gui-macos-x64.dmg"
    sha256 "aaf997061a977754dcb0b9b6440b4323de5fc1fd772162930c9d3fbee4ab070b"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-gui-macos-aarch64.dmg"
    sha256 "def74635476eb84e5f14d8390fef71f92827c3851737c06977c83167b1ca77b5"
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

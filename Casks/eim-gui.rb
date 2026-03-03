cask "eim-gui" do
  version "0.8.3"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.3/eim-gui-macos-x64.dmg"
    sha256 "864c5d0422d3cfa4517e353475d0eb4df65dfafb6614e627a75a0e9d501e16bd"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.3/eim-gui-macos-aarch64.dmg"
    sha256 "835400ad7f920ecd4abcdab7f3b8e51fc24009e713a8734aac9d3e1c9368ed9b"
  end

  name "ESP-IDF Installation Manager"
  desc "GUI application for installing and managing ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  caveats <<~EOS
    ESP-IDF Installation Manager (EIM) has been installed.

    IMPORTANT: ESP-IDF requires Python 3.9, 3.10, 3.11, 3.12, or 3.13.
    Python 3.14+ is not yet supported.

    If you don't have a compatible Python version, install one with:
      brew install python@3.12

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

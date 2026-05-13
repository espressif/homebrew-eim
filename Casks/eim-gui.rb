cask "eim-gui" do
  version "0.12.2"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-gui-macos-x64.dmg"
    sha256 "3004c060f402a45b1a6c2a99f340289237926e0209fa110d54694685a3ce598e"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-gui-macos-aarch64.dmg"
    sha256 "6fbb40852dceadfae4c12e792ff45d2200bb860f4a8d2f99005e8564cc0ff8bc"
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

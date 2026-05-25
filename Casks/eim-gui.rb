cask "eim-gui" do
  version "0.12.6"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-gui-macos-x64.dmg"
    sha256 "4ddbb4405bbe34d612f8d097d62b38a3437a3ba69609ecefd8cbf27f7b9d787b"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-gui-macos-aarch64.dmg"
    sha256 "b5e08a69fdad492e7bd4d3b66a7a3cb39ada3c7909b69314e61639c9bd844dd2"
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

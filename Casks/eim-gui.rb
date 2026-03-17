cask "eim-gui" do
  version "0.9.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-gui-macos-x64.dmg"
    sha256 "0cfdaa8a6612c1a7310b39fde152b1700c8dc8b21ded29ba96818952b7ef3999"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-gui-macos-aarch64.dmg"
    sha256 "357e5eecf970d30e03289717dd9934dc94601092ec419910d018b925b40ddd86"
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

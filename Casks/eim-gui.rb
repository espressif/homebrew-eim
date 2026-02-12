cask "eim-gui" do
  version "0.8.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.0/eim-gui-macos-x64.dmg"
    sha256 "33a5433dfc584aa4ca55aa65c7a3721cfa91c1bafa25b97d7bade83f96c1efa6"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.0/eim-gui-macos-aarch64.dmg"
    sha256 "725d79e6428d0666308c34ef3c4ea523715058bc8f913f4376801ffd5840db92"
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

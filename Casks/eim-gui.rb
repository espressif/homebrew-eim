cask "eim-gui" do
  version "0.10.4"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-gui-macos-x64.dmg"
    sha256 "287c16cf945d50292b4a9bb059f6b6d1816ecc0edac183988d700b80f926d87f"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-gui-macos-aarch64.dmg"
    sha256 "8497b7a45be676269f272540b1b9f808abbba4f8576d166954c382e97e891430"
  end

  name "ESP-IDF Installation Manager"
  desc "GUI application for installing and managing ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  caveats <<~EOS
    ESP-IDF Installation Manager (EIM) has been installed.

    IMPORTANT: ESP-IDF requires Python 3.9, 3.10, 3.11, 3.12, 3.13 or 3.14.
    Python > 3.14 is not yet supported.

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

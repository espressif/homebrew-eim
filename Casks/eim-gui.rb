cask "eim-gui" do
  version "0.11.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-gui-macos-x64.dmg"
    sha256 "c8ef5616717061498658d206904d7fdcf96d15342beb20ad9757cd5d3ed48a94"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-gui-macos-aarch64.dmg"
    sha256 "fa90252d47480e493a38cc9de248f608bbe2b3d92a810048ee4ed2ad71bc32cf"
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

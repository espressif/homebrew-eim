cask "eim-gui" do
  version "0.12.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-gui-macos-x64.dmg"
    sha256 "a097885c3e2785fccf91984f9e6d29418be2f2e367504fcb084756fef1200a22"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-gui-macos-aarch64.dmg"
    sha256 "afad3fb62190c38960007957cd9b8192fb31eb6879a55fd2cc3b625064e9289d"
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

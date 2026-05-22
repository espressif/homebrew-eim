cask "eim-gui" do
  version "0.12.4"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-gui-macos-x64.dmg"
    sha256 "47cf2b6ef33bfb5fd180d92d941cbf238aed7f51e46a0a35dd2418095b34e49a"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-gui-macos-aarch64.dmg"
    sha256 "2e04230858d9e2f59af8908d92fd66c3e3ffe3e793f361dc3ae65339da0200c5"
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

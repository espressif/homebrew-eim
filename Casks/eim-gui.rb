cask "eim-gui" do
  version "0.15.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-gui-macos-x64.dmg"
    sha256 "adc67f7d6fdcc0f535cb612589c1d177ae09dbb192cd9b470be3d739f45acc02"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-gui-macos-aarch64.dmg"
    sha256 "229090040ac751eadbc621bcd441bdc4e8c2941f1342bcf8d7eeda7023502165"
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

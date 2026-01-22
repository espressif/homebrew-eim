cask "eim-gui" do
  version ""

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.0/eim-gui-macos-x64.dmg"
    sha256 "e89703a72361b3ed79b32efda11b9a0e328a1943ca9020eecd2924aea01de5d4"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.0/eim-gui-macos-aarch64.dmg"
    sha256 "0fed34e526da181312b210c6d2ffe23035278049e79711e6e26a6f7fc9d56d4e"
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

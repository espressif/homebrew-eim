cask "eim-gui" do
  version "0.8.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.1/eim-gui-macos-x64.dmg"
    sha256 "d9ccbde646ce78e5f2f87bbf01023d16819ccd318844d7728dc7913eaadf97d6"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.1/eim-gui-macos-aarch64.dmg"
    sha256 "938064e947b3400b084baf78ac2400312e9611b2faa6d5b8edc603af5c317d7d"
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

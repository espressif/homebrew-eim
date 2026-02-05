cask "eim-gui" do
  version "0.7.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.1/eim-gui-macos-x64.dmg"
    sha256 "ab9ce60853ac0871ccd9c739af8669150f5600e8e0860e0f6d7910e2c9e1735e"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.1/eim-gui-macos-aarch64.dmg"
    sha256 "679c557d7cca44fb7e1ed592333debb423a7dc5d1a972d28b0fbd5db83801352"
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

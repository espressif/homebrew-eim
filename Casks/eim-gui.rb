cask "eim-gui" do
  version "0.14.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-gui-macos-x64.dmg"
    sha256 "9083aa91e5f50b5fe0f6798e7802c6275419044e3ca70a792000fcfcf9ee556e"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-gui-macos-aarch64.dmg"
    sha256 "e0115885790ca445be11532afd6faaf2e0899e2804257d3b9ff2ccbfc2f96e12"
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

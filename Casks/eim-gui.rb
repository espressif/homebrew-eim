cask "eim-gui" do
  version "0.8.4"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.4/eim-gui-macos-x64.dmg"
    sha256 "8e356ddac6e81b076a9e3547ab026e5b58e53e84d6bbba53fec010f0e5e63484"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.4/eim-gui-macos-aarch64.dmg"
    sha256 "5b6e0e3e9de84c55adb4dd638991bf4e1045b7542ab4c63da34d82e03a47419e"
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

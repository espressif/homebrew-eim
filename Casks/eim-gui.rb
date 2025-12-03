cask "eim-gui" do
  version "0.5.7"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.7/eim-gui-macos-x64.dmg"
    sha256 "a8a0cae42d3c34f1725cde2eb04867ad6795ea88878b49ed4ce7bf2b321bb034"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.7/eim-gui-macos-aarch64.dmg"
    sha256 "fd5a0b542e37b709abd91609efcf11f180abf59eb6eb2e371cb2013a2ad38791"
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

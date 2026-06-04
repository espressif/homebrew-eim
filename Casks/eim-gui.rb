cask "eim-gui" do
  version "0.13.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-gui-macos-x64.dmg"
    sha256 "f146e502adc323f0aab3e2694d42f13c93fed64b6c0ee4a1725f28296ff83e7e"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-gui-macos-aarch64.dmg"
    sha256 "ce7548d76502cdd3301c27a40beb55871de1f89ab1ea9c8bab3d0196686e675d"
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

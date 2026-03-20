cask "eim-gui" do
  version "0.10.3"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-gui-macos-x64.dmg"
    sha256 "65c7fd590ad514bb47fadc8144b693c0f34a9b19401373d283497e491777a96b"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-gui-macos-aarch64.dmg"
    sha256 "7b326d0f1d1adac2fd1e15f6c3645c5d221ac7325df5c527dda5f52b348c3f9a"
  end

  name "ESP-IDF Installation Manager"
  desc "GUI application for installing and managing ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  caveats <<~EOS
    ESP-IDF Installation Manager (EIM) has been installed.

    IMPORTANT: ESP-IDF requires Python 3.9, 3.10, 3.11, 3.12, 3.13 or 3.14.
    Python > 3.14 is not yet supported.

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

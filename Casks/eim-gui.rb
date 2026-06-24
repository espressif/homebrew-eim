cask "eim-gui" do
  version "0.15.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-gui-macos-x64.dmg"
    sha256 "9901a97b1f8dd910b4ae5fcdba0bfc5598066f47f7e377b5504fc29864e615bb"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-gui-macos-aarch64.dmg"
    sha256 "bdbae9aa7e94dea1671e82f12ab4aa32dfbe7d5466869670564b5b9a009b0a1f"
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

cask "eim-gui" do
  version "0.12.3"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-gui-macos-x64.dmg"
    sha256 "88782ba9bc13ab52d4d02c987db375f03f4a65e05c246c1b4600e0f10fe49ea1"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-gui-macos-aarch64.dmg"
    sha256 "80f475b22b5bec3c84c275c675a355512fe14943c97983b1ea787ed29a8c2b20"
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

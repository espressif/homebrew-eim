cask "eim-gui" do
  version "0.8.5"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.5/eim-gui-macos-x64.dmg"
    sha256 "3d4733746ed685917e19cd0440d70a660e80442ca579a9023c01556cf18b5d2a"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.5/eim-gui-macos-aarch64.dmg"
    sha256 "e77a9aba824a7ce12f7633218f931a0995fe24f52e32454707a38514e3e52d7b"
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

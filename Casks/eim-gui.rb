cask "eim-gui" do
  version "0.12.5"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-gui-macos-x64.dmg"
    sha256 "ff44519717c62451fe57cb2e94383c44e695d5dd679f5399ef316d4023d54197"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-gui-macos-aarch64.dmg"
    sha256 "af0018b25c0f80483b8faab2646e9331697f0e2dbba8b04282e7bccfe23b792d"
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

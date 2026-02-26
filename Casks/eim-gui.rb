cask "eim-gui" do
  version "0.8.2"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.2/eim-gui-macos-x64.dmg"
    sha256 "4806389201530a1ba9da73f67d600fb1de8f0271e7ad7dddf4c60d284065b42e"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.2/eim-gui-macos-aarch64.dmg"
    sha256 "cd7719a299fcfc6fb509a7991fb2b6c2bdac07dbe4e920bd7b736c0c33cbd2b0"
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

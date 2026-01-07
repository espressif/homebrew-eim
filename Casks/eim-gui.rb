cask "eim-gui" do
  version "v0.6.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.6.0/eim-gui-macos-x64.dmg"
    sha256 "6eb1b5d66f9b8e2106b5ff1064befe7d53b75748d2fe2252268ff04f7eb9bcd0"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.6.0/eim-gui-macos-aarch64.dmg"
    sha256 "cac671aa0b49740f015da8760699d3b608cb3a34349351b7a8121c2897936867"
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

cask "eim-gui" do
  version "0.9.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-gui-macos-x64.dmg"
    sha256 "187e55143def9ec1e09c5aec80f959998269ee9babf12579942a17a22ec36ae7"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-gui-macos-aarch64.dmg"
    sha256 "9a95d31fe0b049f36ad45776a2cc3cc22e8909b9dc9cb3b52982b382a2d3c844"
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

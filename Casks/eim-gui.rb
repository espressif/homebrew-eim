cask "eim-gui" do
  version "0.10.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-gui-macos-x64.dmg"
    sha256 "acee0e42a77c3285bac4890ea3373a2369c668359cf365f72479f201ad730973"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-gui-macos-aarch64.dmg"
    sha256 "74756267c47494962a70cac3e76784552929ba1d076d7a2ae549e6b4307cce68"
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

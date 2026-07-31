cask "eim-gui" do
  version "0.17.3"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-gui-macos-x64.dmg"
    sha256 "bfe8feb1997a5cd86fe50508b17feba7c92d8c6f80fca0dbafe295e4c4dc99f5"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-gui-macos-aarch64.dmg"
    sha256 "7972329ac07a9ff2f5e7eccc9d7531cd0bc553ac013860b1856d415b414b31d2"
  end

  name "ESP-IDF Installation Manager"
  desc "GUI application for installing and managing ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  # The GUI binary is CLI-capable (invoked as `eim <command>`), but a
  # cask only installs the .app bundle by default — nothing lands on
  # PATH unless we say so explicitly. This symlinks the executable
  # embedded in the bundle into $(brew --prefix)/bin, so GUI users
  # get the same `eim` command CLI-only users get, without needing
  # to separately `brew install eim`.
  binary "#{appdir}/eim.app/Contents/MacOS/eim"

  caveats <<~EOS
    ESP-IDF Installation Manager (EIM) has been installed.

    The `eim` command is now also available in your terminal.

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

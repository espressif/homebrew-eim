cask "eim-gui" do
  version "0.21.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-gui-macos-x64.dmg"
    sha256 "2b81c4fca35195332afce0ed303dcb6c8c54077f0a0772d2266eaa9b6c7226d3"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-gui-macos-aarch64.dmg"
    sha256 "f9a9d6ee510efd0862105516aac077df8ccd92ad4f330ca3fa1a2a0f5cda8412"
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

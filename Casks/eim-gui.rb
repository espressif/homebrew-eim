cask "eim-gui" do
  version "0.22.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-gui-macos-x64.dmg"
    sha256 "291d50c3642c9813ff97e67a37dccc6520fcf747453c855cc61587ced4f0fc29"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-gui-macos-aarch64.dmg"
    sha256 "3b3eba695db1bb632563ab07ea2dbaa2a73d04f3193149a0300373c2d9867e1f"
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

    IMPORTANT: ESP-IDF requires Python 3.10, 3.11, 3.12, 3.13, 3.14 or 3.15.

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

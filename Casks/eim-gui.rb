cask "eim-gui" do
  version "0.20.1"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-gui-macos-x64.dmg"
    sha256 "367df70ed4540e7ec161d6958e041958f44e156a4e5207830c7dd66d67f3b71d"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-gui-macos-aarch64.dmg"
    sha256 "8d8dac54c65b3f37dce55b25eaedebc1dd42f84821249dfb4e8940fb6a3b7c35"
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

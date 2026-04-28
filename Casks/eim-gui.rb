cask "eim-gui" do
  version "0.11.2"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-gui-macos-x64.dmg"
    sha256 "b95186b7d503ad62a3c22cb1edc59239e918c5eb274c5e4664e53baef43b2c17"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-gui-macos-aarch64.dmg"
    sha256 "758b5e21ac5b5a2c1ddb386e2a0228c7afd3af25c2a6f4b7ec73f26b0096a010"
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

cask "eim-gui" do
  version "0.12.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-gui-macos-x64.dmg"
    sha256 "f17b5201916991a93d7e06d4a07e5535065ae6e42a5b42bd6ad51539e4aeeccb"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-gui-macos-aarch64.dmg"
    sha256 "2ddb1dc4e2a3661f70f43a1bb3a77c9293c9017a239f90b7a5b3bdaf1c444cc8"
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

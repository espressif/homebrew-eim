cask "eim-gui" do
  version "0.11.0"

  on_intel do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-gui-macos-x64.dmg"
    sha256 "4ccaa6ba1c2b35da9a2e06d3e85379ce0de0fa8abb38cb89fb7058316052cc7d"
  end
  on_arm do
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-gui-macos-aarch64.dmg"
    sha256 "f2e0bf7e746cf5546dc93267c167c8173dc09b77264b4eda728df4fabee68f28"
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

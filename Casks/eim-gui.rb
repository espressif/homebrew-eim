cask "eim-gui" do
  version "v0.5.6"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.6/eim-gui-macos-x64.dmg"
    sha256 "51414d06740d12d94d559f75e91a9b5fb4bd36c5bd295ec8798232435ff3263c"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.6/eim-gui-macos-aarch64.dmg"
    sha256 "7756971d199f8519f9ccc06667f2ee63b54d43123cf85cbb39b7ba31a90dc401"
  end

  depends_on "libgcrypt"
  depends_on "glib"
  depends_on "pixman"
  depends_on "sdl2"
  depends_on "libslirp"
  depends_on "dfu-util"
  depends_on "python@3.13" => :recommended
  depends_on "python@3.12" => :recommended
  depends_on "python@3.11" => :recommended
  depends_on "python@3.10" => :recommended

  name "ESP-IDF Installer and Manager"
  desc "GUI application for managing ESP-IDF installations"
  homepage "https://github.com/espressif/idf-im-ui"

  app "eim.app"

  zap trash: [
    "~/Library/Application Support/eim",
    "~/Library/Caches/eim",
    "~/Library/Preferences/com.espressif.eim.plist",
  ]
end

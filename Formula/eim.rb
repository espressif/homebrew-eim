class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.6"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.6/eim-cli-macos-x64.zip"
    sha256 "aee232aa19591a616b56a98d9b04def4db3733e412f93cfa44660b69971a545d"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.6/eim-cli-macos-aarch64.zip"
    sha256 "d03f8a8e0455bb194cae030368ce329914184930c72423458e57ee5aab9970ec"
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

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

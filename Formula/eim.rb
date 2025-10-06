class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.3"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.3/eim-cli-macos-x64.zip"
    sha256 "698a9d65a4f6c6f97752b34827523601647312b70be48e22a062fe8506f9a67e"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.3/eim-cli-macos-aarch64.zip"
    sha256 "b6e61999a35b060a7b63836dee4616903a2858f9aa5455dbd3f0df1507458e8e"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

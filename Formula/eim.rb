class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.2"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-cli-macos-x64.zip"
    sha256 "49dfa599138450cfbee03d1dbdea7811191f97a3c18ac92738ed03b07aa481b3"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-cli-macos-aarch64.zip"
    sha256 "059be02a9bdbd1a02e3dfa058bf8d8eb6b5c874a4cb2c38f3ad8a2e016aba004"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.2"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-cli-macos-x64.zip"
    sha256 "e74e600428f83e4551dd64beafa337c89934a3d1f7e6401b4b4c11a8ec206a53"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.2/eim-cli-macos-aarch64.zip"
    sha256 "0aeb7354690111d0ed5e2198bd3e606d029fd5fdfed22371fb8c73f7b07e4d4b"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

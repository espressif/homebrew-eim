class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.1-test"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-cli-macos-x64.zip"
    sha256 "07f05f39ac9bc3a4765b239d7ce8969767b39435dea5a19fcbef7c6335d5fd4a"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-cli-macos-aarch64.zip"
    sha256 "62d64649f165238dcc4e23132ed3d00e949e0f8f09f204baf0cf55b9faaa9f6a"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.1-test-release"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-cli-macos-x64.zip"
    sha256 "a0391c2869858f6f9c414e6272783b4141b5dbfa00049cc2cea2c2666f37d8c7"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-cli-macos-aarch64.zip"
    sha256 "19363ad0ec65b355491beb818c5412ca12def3bcfdb9437df4b5e9cde6c0f3de"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

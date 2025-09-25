class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.1-test"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-cli-macos-x64.zip"
    sha256 "be7e5d760034baf51f6a8912078e96f0d83de1273a4f293401621f1dd5b51714"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test/eim-cli-macos-aarch64.zip"
    sha256 "ad2840ef0209dae11e4ca1a1c60c36c3824773b3f2400c10ea6132257bfd4826"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

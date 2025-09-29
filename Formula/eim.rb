class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.1-test-release"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-cli-macos-x64.zip"
    sha256 "86c027bd58ffa17dc4c23f3c8c7f69f62c28a4e907a39adde43a81658652a4e1"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.1-test-release/eim-cli-macos-aarch64.zip"
    sha256 "f2d04a8b45fbaebfff68b3b9808b443e6ad0aa2d010c4c442e93bf51c149fb4b"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

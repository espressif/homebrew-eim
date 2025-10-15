class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.5"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.5/eim-cli-macos-x64.zip"
    sha256 "7106549c1b038e1b099b9f5958a16535a0b4af8df280fc874f7545c2fe16efcd"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.5/eim-cli-macos-aarch64.zip"
    sha256 "4245e55c997b06ece3bce9da5f7f2261e1e0d42999651379a84ccf09fbae20de"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

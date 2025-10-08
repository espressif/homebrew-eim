class Eim < Formula
  desc "ESP-IDF Installer and Manager CLI"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.5.4"

  if Hardware::CPU.intel?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.4/eim-cli-macos-x64.zip"
    sha256 "eb12c1e5e8eee9f47df5ce82e2c9c9afb46470f255f66262fe0e39262c430773"
  elsif Hardware::CPU.arm?
    url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.4/eim-cli-macos-aarch64.zip"
    sha256 "f72d16e9869917c6720d31712b68f695482e26cf3cb4bbb91788270a3e41dd5a"
  end

  def install
    bin.install "eim"
  end

  test do
    system "#{bin}/eim", "--version"
  end
end

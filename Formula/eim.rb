# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.7/eim-cli-macos-x64.zip"
      sha256 "1ab47bf71e665ac174e116dc7e7171f1ed4298bbc430dfb135235a93354952a1"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.5.7/eim-cli-macos-aarch64.zip"
      sha256 "87ffcad3e0227bdb344580bf1bd2de3224e1e5f5265c848b1baa0bd4d4eee09b"
    end
  end

  # Runtime dependencies for QEMU (used by ESP-IDF for emulation)
  depends_on "libgcrypt"
  depends_on "glib"
  depends_on "pixman"
  depends_on "sdl2"
  depends_on "libslirp"

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.13. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.13).
      Python 3.14+ is not yet supported.

      Run 'eim' to install ESP-IDF.
    EOS
  end

  test do
    assert_match "eim", shell_output("#{bin}/eim --version")
  end
end

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "v0.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.6.0/eim-cli-macos-x64.zip"
      sha256 "2f35cccb4fe649dc22aed033ee69ba6fc6f2b19a069f94444f09762717b84363"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.6.0/eim-cli-macos-aarch64.zip"
      sha256 "b36fef7578899d1cab6c7ada966edb6ec67f334e64218b36d2199db75537606f"
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

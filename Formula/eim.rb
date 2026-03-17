# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-macos-x64.zip"
      sha256 "8738b2c62a07942124e5b46ad7beaae9794324e1647b618f3c3fe83bf57703b0"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-macos-aarch64.zip"
      sha256 "1e193b1719d685fab91fd5426de0e7a0f9679900579d13890cc78805205207e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-linux-x64.zip"
      sha256 "e769d136be383a5b58116db792658fbdf8340e67d383fd16e2dc6af844de04b6"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-linux-aarch64.zip"
      sha256 "da5c5bd19be12c04ba4964f5fa6c2f264951325ea885eb9c4e96df3aaff3125f"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.13. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
    generate_completions_from_executable(bin/"eim", "completions")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.13).
      Python 3.14+ is not yet supported.

      Shell completions have been installed.
      They will be available in new terminal sessions.
      If they don't work immediately, restart your shell, e.g.:
        exec zsh # in zsh

      Run 'eim' to install ESP-IDF.
    EOS
  end

  test do
    assert_match "eim", shell_output("#{bin}/eim --version")
  end
end

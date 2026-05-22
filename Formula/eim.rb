# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-cli-macos-x64.zip"
      sha256 "ca074e54e00404e58ed37ab0209b33c579985a8bc63e8097c4ca7e45cfbd4a10"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-cli-macos-aarch64.zip"
      sha256 "b7345908941f78b0796fdbeb23c9cca0184da6dfab782f0e118a983bef5761a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-cli-linux-x64.zip"
      sha256 "7635193377761d618b59341cd9f0a25d4b05b53f2b235e7b5a7afde34f2caa7f"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.4/eim-cli-linux-aarch64.zip"
      sha256 "3e2f28c95392e15bac7446be82b6c5cab007c774db427f864676922328067ae9"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.14. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python"

  def install
    bin.install "eim"
    generate_completions_from_executable(bin/"eim", "completions")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

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

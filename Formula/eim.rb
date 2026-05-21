# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-cli-macos-x64.zip"
      sha256 "dbbb9e63137a2f4bde41eb879e553096f1d0ba6ce30e911882951015bac3bc6c"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-cli-macos-aarch64.zip"
      sha256 "cef6a46e340cf7a8bd13fa50f65dc562160e51351149a23beecc9bef8db79e98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-cli-linux-x64.zip"
      sha256 "2489cf7f4ea9b09069c6d3d11739eaefba2da43484bd942d619ec166bbfcef46"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.3/eim-cli-linux-aarch64.zip"
      sha256 "29a3659fead3646be67fe67c1a07215e4d5b72d9c58e7b8b1c236758e59959f9"
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

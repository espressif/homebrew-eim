# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-cli-macos-x64.zip"
      sha256 "ad064512e1e96da20635de6fffc168293d3c14055d2e7b3676c6b60cec8ce2c1"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-cli-macos-aarch64.zip"
      sha256 "2a1286c5f6c6409ba574e7649f8bec4dfa8da132ab44383aa9a732da5550e5d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-cli-linux-x64.zip"
      sha256 "8e0e71399a13ccf62039fd21e02087b5150a0d58a363c791d1f4fad573b8611e"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.16.0/eim-cli-linux-aarch64.zip"
      sha256 "42092a6aad2d383f142e5c6d76faad5abfb945b7b05e8b9daf89f762c8471969"
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

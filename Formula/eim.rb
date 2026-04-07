# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-cli-macos-x64.zip"
      sha256 "18d18866bb0844abf8ad86e2b88531f0a6d9fff0473f3cb14687a65f6ae8de0b"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-cli-macos-aarch64.zip"
      sha256 "cbc79afed296d3e3393d177d69f038f1d2eb203429b6e256d9f4e6e9dcf0a31c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-cli-linux-x64.zip"
      sha256 "d4123274ad1ffe4e2cd55f7739b516f4dbef0a6cecf64a1a014af4a766e09f39"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.1/eim-cli-linux-aarch64.zip"
      sha256 "8e14b2bf13865e1dfd51d4c42c5cf860ff4c11658225b53fddfaf962877239fa"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.14. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
    generate_completions_from_executable(bin/"eim", "completions")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.14).
      Python > 3.14 is not yet supported.

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

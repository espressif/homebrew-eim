# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-cli-macos-x64.zip"
      sha256 "8769363462913ce1208ff56cbe638edb49c7ed7774029bf8f98b8308789b48c1"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-cli-macos-aarch64.zip"
      sha256 "8e3037438b9ff258ded24edcd34b98518afda5c4289ca94cabf415a995fd7bf3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-cli-linux-x64.zip"
      sha256 "abb1deea2a81d2b12009fc3639bc8180856f8b9db7fa786983e5833ee614e9d7"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.0/eim-cli-linux-aarch64.zip"
      sha256 "8b4335ae07255cfa4fbc8bb632da3743416adea0f5c2b7ce63e2d7cf66110bf0"
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

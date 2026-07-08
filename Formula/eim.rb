# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.1/eim-cli-macos-x64.zip"
      sha256 "0b95bf4330988b7ced783413c184aeddedd9239011ac2458d7b637863b737092"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.1/eim-cli-macos-aarch64.zip"
      sha256 "639863cb7ab44db0bdce9015e9b0e6fa1e899897a35b9b6ed67b59d826cb338b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.1/eim-cli-linux-x64.zip"
      sha256 "e3eaf32d64b59af503658a84265d0e02a106be47e10aa7b40752bcad43c8c0a9"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.1/eim-cli-linux-aarch64.zip"
      sha256 "cf2aac44033ecb007cc138363d4b77a3fb25c34658f9d2226e0a332984099dd0"
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

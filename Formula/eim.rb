# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.2/eim-cli-macos-x64_v0.17.2.zip"
      sha256 "7bf826ea14582a01c94bbefdf7de1b7b847c80884a72d599901cf8a224ccfe0f"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.2/eim-cli-macos-aarch64_v0.17.2.zip"
      sha256 "05ee7ae4672549d7e7b0092354b322b87113836ff38dd9d975de8737b78b2360"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.2/eim-cli-linux-x64_v0.17.2.zip"
      sha256 "de7e63168446721f9b88624de120ababf8e8f879c0040f06e5dc7b7c73f5a2f7"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.2/eim-cli-linux-aarch64_v0.17.2.zip"
      sha256 "f24c3bb0489262ddb1431938dff24dc3a17b4ccbf0be2e0124974f4a537fe451"
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

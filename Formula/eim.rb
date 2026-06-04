# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-cli-macos-x64.zip"
      sha256 "9a5f5381ab5d1c2d2dc81ab8479df0135d44469345ed8affa27f33e4f981c89d"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-cli-macos-aarch64.zip"
      sha256 "fa92091ffca354e8b2afd3b905981d1ac9b73f32f88a07942b27f68bee88bba7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-cli-linux-x64.zip"
      sha256 "d21351fc8c6293db5e931f26b801e6ffd3722257b8ba04bb9868092d0f087af9"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.1/eim-cli-linux-aarch64.zip"
      sha256 "7e6f97b600383d10ed8c04a69a882c5ae7e9290456440bbe2780486f59170833"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.20.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-cli-macos-x64.zip"
      sha256 "e216b6e49dfb6fca55b1e5f6237b23bc1c6366377355ff4ba9557118f0506840"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-cli-macos-aarch64.zip"
      sha256 "d8ea1e76f35f46c3f6f62a57e53afd3881f46d4b7effedb6a42d3ed4b64372c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-cli-linux-x64.zip"
      sha256 "f12e049b3d6620ca4e6d7299be0f469bd351353e854140d8fabfa8ad3264e471"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.1/eim-cli-linux-aarch64.zip"
      sha256 "d97b77df1cc0112ccfed6521c81c50940ea9d372d673fec7cd935593d5106e72"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.14. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python"

  def install
    # Linux archives ship the binary under a versioned name (eim_vX.Y.Z)
    # with a plain "eim" symlink next to it; install the real file.
    real_binary = Dir["eim_*"].first || "eim"
    bin.install real_binary => "eim"
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

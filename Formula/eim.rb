# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-macos-x64.zip"
      sha256 "66fd6a73e780552b933955ca141bd3116e146cdec1ccf7a34f3c6af2b2bbe91f"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-macos-aarch64.zip"
      sha256 "045db2fc2de16f75a79bee6d73b860de0a34cf94973e223b7517c365ea569222"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-linux-x64.zip"
      sha256 "8a1065fa4ba1d4ff4b4a89332e540f018cb7f3cf989ab90a526e99dc00c52d32"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-linux-aarch64.zip"
      sha256 "5e88ae1ca7eba08526d6655f301f072b43f36e850a033cbf079021b882fc05bc"
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

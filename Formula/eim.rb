# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.4/eim-cli-macos-x64.zip"
      sha256 "aeaa7da8690cedb07f7f9c173a2e60c6950f9b774c9b44c565363c1f4c3bd434"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.4/eim-cli-macos-aarch64.zip"
      sha256 "52e9ec4c7dfb0b52a955f53439800c68a6e44bb6875b1a1ff93afb36b5ae7fdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.4/eim-cli-linux-x64.zip"
      sha256 "a56e721ceb7bb459488605d522fb5960e693ae2096c119c290b01a4a990f805e"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.4/eim-cli-linux-aarch64.zip"
      sha256 "97502e4db7a5eee0e7f8605375019f83df564cb7b2f0196cabcea2900fdcb04b"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.0/eim-cli-macos-x64.zip"
      sha256 "a006fb8a916aff4d6ae08f98120b4fc55bb72241071601b61f271a6d28723332"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.0/eim-cli-macos-aarch64.zip"
      sha256 "a605c15163498875ef6a9efef5b82a9294df90a71f1a411e17f262abd55d6f2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.0/eim-cli-linux-x64.zip"
      sha256 "43ffeaf412aae78ee41c24cb430434e10e87521e74d1c4d6a2636a181d5f4f80"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.20.0/eim-cli-linux-aarch64.zip"
      sha256 "40675bb951985b6dbb3af55b15e684e1759c8d0a14084d4453412ca67e7249fe"
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

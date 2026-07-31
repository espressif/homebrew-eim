# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-macos-x64.zip"
      sha256 "1c3efbb255cc8a612d198a860372ba0b09f07db5d94b6063f3ab701de7ebe8f8"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-macos-aarch64.zip"
      sha256 "d59d6642e7258d0678476aa56071d227875ccbcb7d3ed480aa46176f65110689"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-linux-x64.zip"
      sha256 "2012356b638db7432af81e3c48fd470983f9afa35d9ac663f593a57de3a23669"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-linux-aarch64.zip"
      sha256 "a98bfeb7f14fbe27770d90a4edc0a415f61e95127b0e21c4db195f763923a8b3"
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

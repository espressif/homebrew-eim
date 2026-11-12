# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.0/eim-cli-macos-x64.zip"
      sha256 "39734d12e3a3fa23b76b3a3dcffd1d9043e0e642b45e9927a5071c5116f7a27f"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.0/eim-cli-macos-aarch64.zip"
      sha256 "bfb87496ac1f42dfe2752ca75578145964b39d589ba7cd45b068d415419f45d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.0/eim-cli-linux-x64.zip"
      sha256 "d5222fab148d6a0ed4bfcc9c9105a868cb537d0cb1dca97db6a2845add874564"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.0/eim-cli-linux-aarch64.zip"
      sha256 "5eaf71101d140f74212c1f17ea2ffb4ae1f8220fafcfa5a94dd74eabbc52a1db"
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

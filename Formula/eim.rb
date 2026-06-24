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
      sha256 "810237b9a54ac28ef8381873f1499d70804eba8686f1149e1992f61da8c70c7c"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-macos-aarch64.zip"
      sha256 "459562ba66ee53652c284b846bf80b228ef4f8db3c36e84cf2d216ace15a4ec1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-linux-x64.zip"
      sha256 "138f5a8e7fc50c430162ee2c9220dcd1b27c4ea3441d98d33e6f0f9e30825f60"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.15.0/eim-cli-linux-aarch64.zip"
      sha256 "63aa7100aeb65e86969c39858fa26c1e246a28cf22c58ee16fbb2278a0e4f8a8"
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

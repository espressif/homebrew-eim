# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.23.0/eim-cli-macos-x64.zip"
      sha256 "f2363af79df25e98d641519801107d8423b6e2ab4efaf66fdaef5c118ba51782"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.23.0/eim-cli-macos-aarch64.zip"
      sha256 "697b61a16da4b1b4fa939ee08448fc0a9644e7dfa5555ad3134f4a5223ab1fb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.23.0/eim-cli-linux-x64.zip"
      sha256 "c4433553a1ead530ed5a41923275feb29d5f922518d3693a1692e4f00f33cafb"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.23.0/eim-cli-linux-aarch64.zip"
      sha256 "0994f532ff8b56af6e87081eebed1fb18b330e6e11e94dba875a6632b8c6720a"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.10-3.15. We install python@3.12 as default.
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

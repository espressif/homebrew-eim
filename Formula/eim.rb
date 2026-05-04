# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-cli-macos-x64.zip"
      sha256 "400e876ab4e03653d94e56277b730bef77cac9bef6aacb31c03d6538b0b97ae0"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-cli-macos-aarch64.zip"
      sha256 "34d80107fb339a4b838e1c170c6ff529b6823012d8392e3b927322c2237c3fe4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-cli-linux-x64.zip"
      sha256 "23c794dcb470466e7250e56b0148c2cd009cf603620cecf9ff07c73ea31b9dfe"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.0/eim-cli-linux-aarch64.zip"
      sha256 "ed906a0e0cbecc23da4e45f4be6dcda34eb5c90960f6dbf540b30d7423b2e3e9"
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

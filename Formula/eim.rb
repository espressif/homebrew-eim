# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-cli-macos-x64.zip"
      sha256 "85e1f61f6a78b3a6a2ca3846b9adfa58d935d4ce392a9024abb6bf945eedd765"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-cli-macos-aarch64.zip"
      sha256 "5f76952ece70b0e1b2eb11ad6cd20dc952d1b21d303821482b991b84fb800305"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-cli-linux-x64.zip"
      sha256 "ec3e6040a5487861ec044e58a85dd570a3855434a28cec09035c52b3726c2a34"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.3/eim-cli-linux-aarch64.zip"
      sha256 "b9f68d295f3f745f2e8f95e854dae66bfacaba0079e7f8d5be8f03aebb6fd720"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.14. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
    generate_completions_from_executable(bin/"eim", "completions")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.14).
      Python > 3.14 is not yet supported.

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

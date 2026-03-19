# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-cli-macos-x64.zip"
      sha256 "b547d301883be835839f3449db73f70d1c38babdeea214977f1da23c8c669a35"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-cli-macos-aarch64.zip"
      sha256 "4615801986ac53b7c573a4c8ec7051910ee378d9d415aa3f16c5bdb8263c71d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-cli-linux-x64.zip"
      sha256 "4e7d939347a56ce2659634a0d28d6fbb0de03126dacd70bfc1bb7ca133a63e17"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.1/eim-cli-linux-aarch64.zip"
      sha256 "ac280bf68e9eee14c02894df9af37c6a72b4dc0719df52ca51a1937b88821af5"
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

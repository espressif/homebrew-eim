# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.10.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-cli-macos-x64.zip"
      sha256 "87bdd3c9c3d9df625a4f450b8d1d3f5de291707d12026382ab7dab7b2c63659d"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-cli-macos-aarch64.zip"
      sha256 "e7588ac99d18d8c2b3a78558bc3756ea17369620187008e62f336560e506d8b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-cli-linux-x64.zip"
      sha256 "12414c271384b48afd5d5e774240f3718beb8d8bbf803b39d292d1caf73160c4"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.4/eim-cli-linux-aarch64.zip"
      sha256 "374fc289f82a562701a53d83a06b001b0ddc3857d32bbf555975c16af6dfd8fb"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.0/eim-cli-macos-x64.zip"
      sha256 "50cb1d16b588cfdac37ce5a421b7cf6fd31590e2ed465fe0042fe6612f669e5b"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.0/eim-cli-macos-aarch64.zip"
      sha256 "48158dcd073bc0596b128a7086ab855573a3fe287da30918eca3b953e75e1277"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.0/eim-cli-linux-x64.zip"
      sha256 "c97ac96c5adca8c109964c22c46de8340fbcb23334fca0f5d340d31edb079b40"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.0/eim-cli-linux-aarch64.zip"
      sha256 "74905e9c2a7af5df911aad93b8ae34ebab9b8e3b0db5c1440a3a39159e8b34d7"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.13. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
    generate_completions_from_executable(bin/"eim", "completions")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.13).
      Python 3.14+ is not yet supported.

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

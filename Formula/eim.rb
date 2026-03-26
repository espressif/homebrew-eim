# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.10.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.5/eim-cli-macos-x64.zip"
      sha256 "4b0bccabf9ebccac841a32941a680fade517196f65db182d332b4521bbfcc991"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.5/eim-cli-macos-aarch64.zip"
      sha256 "ae909360a3c973020a5b6073273385e7fe828a428a5e580a1e94d96b0325b971"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.5/eim-cli-linux-x64.zip"
      sha256 "0e7cc1ab2b80b1b9a890b67e46113a152df95200963cb4aeb44acd60e273256e"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.10.5/eim-cli-linux-aarch64.zip"
      sha256 "5bb39cb6d77b46f78ab1a11c2691bf11b8a29e9fd5d4de8ee72cef3cbe081e9a"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-macos-x64.zip"
      sha256 "d318c39948421eb1a9e6aa30d1f4191557472c6e584a5866d2ad2f44aba29b91"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-macos-aarch64.zip"
      sha256 "f9135b371fea6c5fe5b8154b97fde6e78a1fc4818cd83287163462f1fa5710b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-linux-x64.zip"
      sha256 "c00430705bf00ce9f6f00c0f0c56387a8f36486ddb93aa9fc9ba0921b5f7da62"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-linux-aarch64.zip"
      sha256 "c20a5edfce6b8fecc8f1c995d34b47cae6b328b10ffa3c14152e0e4d3bff3265"
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

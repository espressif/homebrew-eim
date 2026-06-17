# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-cli-macos-x64.zip"
      sha256 "57cf92b93254e4f704203d584af1df530e0ed78e32f0c7ceb43f628c34780eb7"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-cli-macos-aarch64.zip"
      sha256 "423726d98725a2b713e9eddef8e23e1f1845807fc0bdfc2451aad80286655d1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-cli-linux-x64.zip"
      sha256 "0442468dfed3c9c4e888fade8650495bc816768009bfc9c9b8eee278bdbbe390"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.14.1/eim-cli-linux-aarch64.zip"
      sha256 "cb96b64f27802eee8ba3cd9ae0f7a70346e12cb6db5179b9c9a8f45f55d14a17"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-cli-macos-x64.zip"
      sha256 "5b6f3ca91d84bb37318ed338016a1b00efb931369cfe84af8c94f5ea15bed8f9"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-cli-macos-aarch64.zip"
      sha256 "e90d6a96fa829b8138a7e48f774e9fbe128d78bfbbaebfd9ce7f125608a59e88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-cli-linux-x64.zip"
      sha256 "c028091edef37c029b6f77c18bfa561db692e460406abda5bcd5256aa0dc4ec1"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.13.0/eim-cli-linux-aarch64.zip"
      sha256 "49af3c20b2686d85dc3cfc60fde008ce3a9cc15273d4f2baffd15aa80147d9fe"
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

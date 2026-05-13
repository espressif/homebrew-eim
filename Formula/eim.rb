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
      sha256 "e4194ea0a3afde50fd33568b174cff0e85e74075737bc80c0be657b8b0cb82b4"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-macos-aarch64.zip"
      sha256 "35e0f2e7ae65c6ca003144b3fc29fa8dce7fc04769d247de7fb5b3ed99bda505"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-linux-x64.zip"
      sha256 "074e66d3d86b7c7d04761babfcbfc54ee4acb9eaa24193960d85805dbb3827c6"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.1/eim-cli-linux-aarch64.zip"
      sha256 "7c11a6683349e7a57f322e23ba7ca1bb822f7b55803743fef7d6d9defaeb038a"
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

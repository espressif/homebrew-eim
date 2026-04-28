# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-cli-macos-x64.zip"
      sha256 "cf561a61fda56dc73ef4492f702c125c643402832faa89fd069e89501c5b18d8"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-cli-macos-aarch64.zip"
      sha256 "f9d4190781f4faa32024db957e860513b60f0dff0f2d5fc14c4a80d702e0a980"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-cli-linux-x64.zip"
      sha256 "7bf10a35aac88850c6b8157a2bdd7b4d3c85c622b87a647f1431f75fcf1c1470"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.2/eim-cli-linux-aarch64.zip"
      sha256 "cd8af2c11324778d286ddae8196601d09432dce00b554fcced65a36e79adde61"
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

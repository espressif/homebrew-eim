# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-macos-x64.zip"
      sha256 "af274a49520a1b4792376dd9ed0fbc23b8c408227e7e962d0ada0b742a3ecf65"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-macos-aarch64.zip"
      sha256 "e91d166622b46faa7edd943164d1ea0a8699691d5d3fb569625db5a327d30093"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-linux-x64.zip"
      sha256 "cf14cd7aa148b6e2cf368961559ca9661fd127c5b4db230eeadb0219e79a01db"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.9.0/eim-cli-linux-aarch64.zip"
      sha256 "b6500e17d95298f0bd2ebaab48bf242165ddf7a32d87b60b47817517e3a471b7"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-cli-macos-x64.zip"
      sha256 "7dc037dc39ab23c7d67d42f7f1a773276533ad90b2bde3b615783dec0c496e61"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-cli-macos-aarch64.zip"
      sha256 "36a6c1362e35e7d02144f9e6f3222b7e115c7cf69048c8d001aa39060a3bfadb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-cli-linux-x64.zip"
      sha256 "adff97e17a135058a32d2a1e99d43f60d9aee36a7952d8960c592aca84c4b228"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.5/eim-cli-linux-aarch64.zip"
      sha256 "dd6972a6bbc0af04635f851971e1a19c9952a4f622398bac4c8ff4a922ec5f8d"
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

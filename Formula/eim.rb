# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-cli-macos-x64.zip"
      sha256 "da5bbb12d8787e68a6367c214fd00fd47af4955846f02557b62a8cdd70b4ed3d"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-cli-macos-aarch64.zip"
      sha256 "cd31a3739caf6810a9964abedd539fc89c06125487c84e7fa8f01e4eb27df804"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-cli-linux-x64.zip"
      sha256 "275e3b0836c109ea7426bd28dad7ca91e8813c9ed62a483631e8a195e125451d"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.6/eim-cli-linux-aarch64.zip"
      sha256 "92556210dd32ece4e5efa0dfc3d166392feafde11e97954f4819a428f6898820"
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

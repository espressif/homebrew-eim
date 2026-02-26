# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.2/eim-cli-macos-x64.zip"
      sha256 "402df3c217198f1eb68d64b17f79428246d82956cecc21102765d42871307530"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.8.2/eim-cli-macos-aarch64.zip"
      sha256 "fdc2e756203e5f57a4de5818aa784e86d0af1d3bf631af38a64916aff10d1b0d"
    end
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.13. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python@3.12"

  def install
    bin.install "eim"
    (zsh_completion/"_eim").write Utils.safe_popen_read("#{bin}/eim", "completions", "zsh")
  end

  def caveats
    <<~EOS
      ESP-IDF Installation Manager (EIM) has been installed.

      Python 3.12 was installed as a dependency (ESP-IDF requires Python 3.9-3.13).
      Python 3.14+ is not yet supported.

      Zsh completions have been installed.
      They will be available in new terminal sessions.
      If they don't work immediately, restart your shell:
        exec zsh

      Run 'eim' to install ESP-IDF.
    EOS
  end

  test do
    assert_match "eim", shell_output("#{bin}/eim --version")
  end
end

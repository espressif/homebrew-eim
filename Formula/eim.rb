# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version ""
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.0/eim-cli-macos-x64.zip"
      sha256 "6742dc5f26e84d814fa27348fa158cccb4eb156250b7b2b61b98b2c33fd2e757"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.7.0/eim-cli-macos-aarch64.zip"
      sha256 "7712d258926e74364ebca088849e2d40d01c11b9bcafadb835db414db5115603"
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

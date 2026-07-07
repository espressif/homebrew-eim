# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.0/eim-cli-macos-x64.zip"
      sha256 "1ee7141be9eaf59e1653cf088eb57d9bfe98e64056ac306eed2d9127509e42f2"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.0/eim-cli-macos-aarch64.zip"
      sha256 "344bede57a12a8123765e71ff0d39714cb64d1b76792c2bdcbcdcc4582ceaaf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.0/eim-cli-linux-x64.zip"
      sha256 "daa54fe8b8abff5e2a6300ccb4dbe4f2e292e7330db6e5124d3364cc6c611a89"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.0/eim-cli-linux-aarch64.zip"
      sha256 "36415e4b02f0a195a9e73c82c7b138d3bd5ef7f5213cd25252c836da94a9ca41"
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

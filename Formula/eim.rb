# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-cli-macos-x64.zip"
      sha256 "9a816d36aa95737f313da0e118109de519ee6250ff6f66a82b39fb6a5811e831"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-cli-macos-aarch64.zip"
      sha256 "957d457850eb61e9dbebd2223a79902ce6b0e3da947b4789201992b20acfa65e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-cli-linux-x64.zip"
      sha256 "61797e0670da1dd96ec9070589d758a71221e8f17a94c630badb20ec8c1dc6e2"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.12.2/eim-cli-linux-aarch64.zip"
      sha256 "1db96653eb8b010d048d2492a4ffb051491666531ae622b3147cb880232d63b0"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-cli-macos-x64.zip"
      sha256 "9c5e82cf36c1f77f7e1d41c47524b3884551945c97ccce76400648038cc94bf2"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-cli-macos-aarch64.zip"
      sha256 "157afdf9b272f600b791076b9c1239e1db61259792629d865c4305d994c381a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-cli-linux-x64.zip"
      sha256 "dcec11b8d3c970bdefec9b92a1ec1e03fcecba1cb6a7938bfaf522fde985627d"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.11.0/eim-cli-linux-aarch64.zip"
      sha256 "7cf02e1ce508855a0ebae2beac57d8191e2ca1f3630eac6f90d69b905bbb1de3"
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

# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.19.0/eim-cli-macos-x64.zip"
      sha256 "1ffc0aca3ae8760e8fc997fa902b1458970e1624e485d6cb71cd7f3cfc58990f"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.19.0/eim-cli-macos-aarch64.zip"
      sha256 "ef96dba210579b8ea71aa6eecb023c90b413b8a8ce85d84282215b0fd79827a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.19.0/eim-cli-linux-x64.zip"
      sha256 "03347e62c8309d7a93936b9f804e9e6de490cf7704602a5171e88c8c2b2f53eb"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.19.0/eim-cli-linux-aarch64.zip"
      sha256 "15b78ec46e2c84f88b64846c4e3e80072a8dca21bd07391a462408f89dac11df"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.9-3.14. We install python@3.12 as default.
  # If user already has python@3.12, Homebrew won't reinstall it.
  depends_on "python"

  def install
    # Linux archives ship the binary under a versioned name (eim_vX.Y.Z)
    # with a plain "eim" symlink next to it; install the real file.
    real_binary = Dir["eim_*"].first || "eim"
    bin.install real_binary => "eim"
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

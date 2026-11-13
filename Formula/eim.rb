# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.21.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-cli-macos-x64.zip"
      sha256 "f3334e87f718ef223b044d99ed64f72041efc5d1c950c7c25165df25b47cb81b"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-cli-macos-aarch64.zip"
      sha256 "a03aa71a720576a5e5615e9022023e472ee479f6542e987faf0d0197d60d9a8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-cli-linux-x64.zip"
      sha256 "0391b2fce3bad521b3403d656f9569ccd5cc066eeabd55f645139409cb8e691c"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.21.1/eim-cli-linux-aarch64.zip"
      sha256 "8d3518ee14f88332e122a88fb0d497172c472b9891a570db0cd8e8012626863c"
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

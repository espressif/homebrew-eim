# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-cli-macos-x64.zip"
      sha256 "6ab522af3a3f508166cdd18f7023a888261bb198efe32c325ce0cb36ddb388f4"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-cli-macos-aarch64.zip"
      sha256 "98042ad2d2977435c886583e3941b55b07147e255822d7d502edf2b52680fde4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-cli-linux-x64.zip"
      sha256 "60230f603c72e21535b2861e388e0770bf67eae124284df4240742854e649fd0"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.22.0/eim-cli-linux-aarch64.zip"
      sha256 "954ba6f81920feb068683340039de4e9a9625789f4d9bf1f7248b875124d2600"
    end
    # Homebrew on Linux (Linuxbrew) doesn't support ARMv7 at all, so ARMv7 is not considered here
  end

  # DFU utility for flashing
  depends_on "dfu-util"

  # ESP-IDF requires Python 3.10-3.15. We install python@3.12 as default.
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

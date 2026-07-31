# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-macos-x64.zip"
      sha256 "da8c642c2c1e8fe10961214dc3438c6c85e437457db1b94f7d14ea197cf7fb31"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-macos-aarch64.zip"
      sha256 "fb451b7577f6b80e13f9bf6bd007bc31d5190a5a8af93026a55eca7ddf5b28b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-linux-x64.zip"
      sha256 "bf32f15382348eb94762472ff9596477d244540189a6ee3e6a8f0e40e26ca5d3"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.17.3/eim-cli-linux-aarch64.zip"
      sha256 "9ed24f7e5723ce8aa89bf5fff54777989dcd554b9f1993af89ded9c0db2f71fc"
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

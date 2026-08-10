# typed: false
# frozen_string_literal: true

class Eim < Formula
  desc "ESP-IDF Installation Manager - CLI tool for setting up ESP-IDF development environment"
  homepage "https://github.com/espressif/idf-im-ui"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.18.0/eim-cli-macos-x64.zip"
      sha256 "1d6ba45457757d4b0b21bb2ae9e27b20408acf75d68efe2268e1d6a80ce27dc2"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.18.0/eim-cli-macos-aarch64.zip"
      sha256 "6f266f3363a473dd353789d779bd084833872c0bbf647b1d2c48ecaef784b93b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.18.0/eim-cli-linux-x64.zip"
      sha256 "f1a1425b0e66de7b5c9cf48ff7e34552c49f65d7eeefaf7b481d176f90e694e8"
    end
    on_arm do
      url "https://github.com/espressif/idf-im-ui/releases/download/v0.18.0/eim-cli-linux-aarch64.zip"
      sha256 "3bba2477216f8ba899181397329138838f32d67300f2461d98be6cb5ffade070"
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

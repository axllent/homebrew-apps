class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.19.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-darwin-amd64.tar.gz"
      sha256 "78660a1dfc8078e887e1f1143a6954daa32e5d4467da1b5d5fa1d14a3a04eb97"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-darwin-arm64.tar.gz"
      sha256 "fb49155d6044fa16d6981f3ee8045df31147d999d4f89b63818eb4c9f111bd7a"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-linux-386.tar.gz"
      sha256 "46774816f87248d96f71226edc4f1a7a68f272f2ad1e4fdf11439291f5b3c944"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-linux-amd64.tar.gz"
      sha256 "c8112e9d9a9c0cbbf7531a4146b0f3af3a07ae6a86c565ebb8719fd878c859a4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-linux-arm.tar.gz"
      sha256 "22a8f6ddefb769c3a978c833e6cab3f5872806e33878cb83ba298383c4a93fbd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.0/mailpit-linux-arm64.tar.gz"
      sha256 "c6f67f2498a139349cd46f73fc0e5e7645edb626e5d8db230f2af3a04d7d2ce9"

      def install
        bin.install "mailpit"
      end
    end
  end

  service do
    run opt_bin/"mailpit"
    keep_alive true
    log_path var/"log/mailpit.log"
    error_log_path var/"log/mailpit.log"
  end

  test do
    address = "127.0.0.1:#{free_port}"
    fork { exec "#{bin}/mailpit", "--listen", address }
    sleep 2

    output = shell_output("curl --silent #{address}")
    assert_match "<title>Mailpit</title>", output
  end
end

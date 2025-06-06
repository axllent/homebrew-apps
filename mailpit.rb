class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.26.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-darwin-amd64.tar.gz"
      sha256 "ffa598f313827540e4f1916e8fc5fd1dfebab51812929600d3250f97ca4a9421"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-darwin-arm64.tar.gz"
      sha256 "0ccf282c78cfbf03a13f925c73763a681b78aa9755d216966168e136574859eb"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-linux-386.tar.gz"
      sha256 "f88301cce5f9d00ed40645b6975413721346f5e1541702e7866173a18b35dcd3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-linux-amd64.tar.gz"
      sha256 "0e96bb6c06e4d9a87aa551a6dcb3c064af7e83aae6ad276c5923a3f68b2c7195"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-linux-arm.tar.gz"
      sha256 "e5266cf0452cdb3378d2c8d72f24b998bba2b7d00994b6087d06b1ab147820ad"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.0/mailpit-linux-arm64.tar.gz"
      sha256 "0b68cbc169124c8c0f87acdab61d8c38c0b7584fcf25ac71184f427af252a312"

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

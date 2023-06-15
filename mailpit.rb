class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.20"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-darwin-amd64.tar.gz"
      sha256 "28e9c7fa05d25bbc8cb62499a104b276ea9de8cf58a24b2970a407bec29c5209"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-darwin-arm64.tar.gz"
      sha256 "756f12ee1b0d9c0c441beb6eaf2805df294de56212b0635e2b4a3917edd4c108"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-linux-386.tar.gz"
      sha256 "288653c8033897307dd2e1dada32e1603695e24e6f554343fd01f9a1e7744303"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-linux-amd64.tar.gz"
      sha256 "93a9965f27dbbf4f689bc7d89832908282a00a78ca6140d461edbdf8fbd7efe7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-linux-arm.tar.gz"
      sha256 "774653431a1ca3961aa7a96998232e91b73bfd34801299d7eade7c0f1bd7f28a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.20/mailpit-linux-arm64.tar.gz"
      sha256 "df656ddcf7f0cc497f7359bf1a81094fb466ca658459b6f533233d59bcb6098f"

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

class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.17.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-darwin-amd64.tar.gz"
      sha256 "8a021c107ba1f1c313519266904be5e556169bc0eb536b3d4f37f454d43e33c3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-darwin-arm64.tar.gz"
      sha256 "77e54d9fac8cd73efed30caaf07ddc385a0dd9895abda62a7b610373a8b38527"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-linux-386.tar.gz"
      sha256 "c8d88b6d30de3ca962107f3f948dfd6c0ebe9a055c02cdc95ca4fa5753a64338"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-linux-amd64.tar.gz"
      sha256 "f8b616fd9b39f385648e7c5b8fe00d74911b477af5bc4574e7b4951683d02c4a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-linux-arm.tar.gz"
      sha256 "704f0eb2dbea492dc10565f36675b6a50dd212e6b3c24dec1baba44b34a966f9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.0/mailpit-linux-arm64.tar.gz"
      sha256 "1527bacf6f56e1d9e20bd7b658ea2f5329cd5d060f3c7df0a16d9135ddccd0e4"

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

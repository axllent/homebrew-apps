class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-darwin-amd64.tar.gz"
      sha256 "a82cc52d40087f1c41adc294b2fba86d05e1a30f12d548e9c09b8633c85ebd17"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-darwin-arm64.tar.gz"
      sha256 "82ed8b4d02deecd2268a46f25557d78048c0fbfc348f16f6fff81bc7f37825e6"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-linux-386.tar.gz"
      sha256 "146039fc3ddbf51605d30c84ca00c16779c7c969a4727b1caadaa30940017fa4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-linux-amd64.tar.gz"
      sha256 "63de2a853d5719a6da06bd1eff2394e732d5c9386da9f196e5de64fdbe48c331"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-linux-arm.tar.gz"
      sha256 "7f69dca8b5c0511a38995ce9fc1229881224b4fa6f9f7148399aea74529380dc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.2/mailpit-linux-arm64.tar.gz"
      sha256 "c82f387e41b9471db34036462548c519bf9d7865c27d3ee587e189acbdb94d6a"

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

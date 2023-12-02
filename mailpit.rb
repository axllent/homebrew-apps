class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.10.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-darwin-amd64.tar.gz"
      sha256 "6af70b6a5aa17da555f91cf54f91cc4d1452087546f036b8eb447bd42dd2c090"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-darwin-arm64.tar.gz"
      sha256 "8c2bb1e0fcc44ce82ded5ad3336ff1f58dd928ce1a83a0df5c5776c6241cf627"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-linux-386.tar.gz"
      sha256 "b9ee89a07e3412d8f95bd45497bf2db8adfb650133e184c3a80c7bfba20c9199"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-linux-amd64.tar.gz"
      sha256 "63dd7bb0ce3f33ea915fcd9c9f7b4e5eb9a3bdec0c3ebb0ae309774642d5622d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-linux-arm.tar.gz"
      sha256 "2503a1688d98f35162ebf287905a970307a10d1d08f11c85a6336c2d85f64220"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.2/mailpit-linux-arm64.tar.gz"
      sha256 "80c1c129b6cd7328f6d0822d657d8acaba5f6c08211c3b216a8e19944096a57d"

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

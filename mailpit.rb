class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-darwin-amd64.tar.gz"
      sha256 "fcddcb978fb9e2c36712683f39ea4bc1427e71ab2f47667284be6ebe7e59dd0f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-darwin-arm64.tar.gz"
      sha256 "2c8fb3552ea8933b8e8db5ac48618e97f2ba34ec27715b2f3ddb4357cc7e5d84"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-linux-386.tar.gz"
      sha256 "8c763e381bedd1f0a9cb4c8a506d19b60240d9f9b255bac901eed65ba4443133"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-linux-amd64.tar.gz"
      sha256 "8468d79e44a09f3d9fdb5cecdfcb7d5ae9238ab57642abb58a4335b25c50f33c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-linux-arm.tar.gz"
      sha256 "b850fda49db4060e28252b2b78ebcff1fef819f736e892dea4aedade62c0ffb2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.0/mailpit-linux-arm64.tar.gz"
      sha256 "5fa0c2d3dafe9b2ccecdb41328883784247e5f9d43324eca526399fb69ccfa5f"

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

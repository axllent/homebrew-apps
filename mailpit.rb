class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.18"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-darwin-amd64.tar.gz"
      sha256 "24cded145dc59ec836ab0ead968ca14c3041f96b0d4c871560934904a4fa2e98"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-darwin-arm64.tar.gz"
      sha256 "edf31ddded869018c234add37e8f99f2e3f35b87a3ad6c23f15437d99113ec16"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-linux-386.tar.gz"
      sha256 "4e27fa37f26a8d3fdc963392e7d3581bd19c1175da2fcc4e90ed88040fde3a25"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-linux-amd64.tar.gz"
      sha256 "4cef66175fde3b3f3d021e286a766931e908e085401ae539c48ce09ddb9df41d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-linux-arm.tar.gz"
      sha256 "99e7a1aa6a2ccaba4207e5c7f60df42d838d0c3b002027247e7815a61e812307"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.18/mailpit-linux-arm64.tar.gz"
      sha256 "5085b0561ebfa3c8e7237d168a76b7cc6f90a9d0d9d934475fc98870c023f421"

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

class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.14.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-darwin-amd64.tar.gz"
      sha256 "9ab299b2918a8eeb4666b0dae4ad7fff0c10b42ffa209f7ea8ce8b19cd854891"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-darwin-arm64.tar.gz"
      sha256 "73bf5602de55e0e9be46fc9d0d8983d7010e259fab0cb18c482d677b2d43d18a"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-linux-386.tar.gz"
      sha256 "67152956300c69d14517b090f85a233616a75ce86bc6a18b6763fcf6556e4fdf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-linux-amd64.tar.gz"
      sha256 "67722295b8c5d7b76517ee9e8b8376f9833575328092952a0d38aead1cfefae0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-linux-arm.tar.gz"
      sha256 "602c23e8a9aba4fc678a6503f2d14a44251efd6aada5cc39ac97bd1664b3f0e2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.0/mailpit-linux-arm64.tar.gz"
      sha256 "3466fbc36f8beeec334861f6f4294de261251c9628c61a08f9e5bcebbe14b842"

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

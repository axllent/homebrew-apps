class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.15"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-darwin-amd64.tar.gz"
      sha256 "4e5d2be4d7e200f898652877d87b78ce62bb9fabb2968cfdb7d9fb3856420d3e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-darwin-arm64.tar.gz"
      sha256 "8ec436490fd8dc381a0f6cafc11b34aded959c10f2305ddff3be214bbb0fa290"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-linux-386.tar.gz"
      sha256 "03831abcd4141a42b3c28873255f4e83b0de5391b7460aca4c058e776bd581a4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-linux-amd64.tar.gz"
      sha256 "49b181af2a1bc4165578834f2853616d54324a19b54f81dbed48780d06947962"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-linux-arm.tar.gz"
      sha256 "ebcb35f088c7342678a9c4068475c5e3dd6cc0f25aea7e8c9ece50438b523c55"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.15/mailpit-linux-arm64.tar.gz"
      sha256 "cc0d70dafdb0669bd43b28477c5b49ca243ab407f259599f82279e35d4f12ef5"

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

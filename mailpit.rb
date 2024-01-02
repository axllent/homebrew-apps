class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.12.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-darwin-amd64.tar.gz"
      sha256 "6b6ab4b5eb3eccf9c868d64ad8358ecb3126f2da44445238c522c2b6fcb3a619"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-darwin-arm64.tar.gz"
      sha256 "a2f07010991c487df33fd28379437cabafa9e79186710e9f29a2a84001ec38b7"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-linux-386.tar.gz"
      sha256 "e3e3ebc71bf34dfaa34c66a7753934ecaaac6d53579862a51b99d7a83a468fb6"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-linux-amd64.tar.gz"
      sha256 "d0a2d9c4df7dd4808d1292d6ed1e940b370038b0520b451885add902a5e04a9c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-linux-arm.tar.gz"
      sha256 "8dec7edca19ba3d459a473a8bfc1c0379a786b7da1ab51f3efaaa507be993024"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.0/mailpit-linux-arm64.tar.gz"
      sha256 "02edf731a530daed441da36244729503997e5d0a4bb6863f4f156765eab442bf"

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

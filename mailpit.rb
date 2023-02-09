class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.3.8"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-darwin-amd64.tar.gz"
      sha256 "83bc1bdccc33267c2ec5f67bc1082370de704cc18ecfab77d537acd785ef029b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-darwin-arm64.tar.gz"
      sha256 "a5b1601694957a2506a4dcb7c91609bfaa7042467d4dee156e24de16c0d62390"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-linux-386.tar.gz"
      sha256 "c584d6d3a52cea58242d8094c2e4faa22def5e16397e2faeb5af6a5a30324fb2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-linux-amd64.tar.gz"
      sha256 "529d91e1aa2e429cabc75dac87b468358569a8aa9470c7f8522ae98eb9593a8d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-linux-arm.tar.gz"
      sha256 "cba5cfba470527b45cb2add6b46859ad851458ad315488d99b45779936093816"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.8/mailpit-linux-arm64.tar.gz"
      sha256 "e7153f0d063e83c3852eb4d2b06883812ded15806b654fdc8e0357ef3e9e4f85"

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

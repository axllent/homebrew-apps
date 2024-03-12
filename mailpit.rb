class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.14.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-darwin-amd64.tar.gz"
      sha256 "cf7922ff2b63470f98fa7db2cb10c6e4bfdedc0ebc1a3592596538335eca11fe"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-darwin-arm64.tar.gz"
      sha256 "3bcca081284faae9633eefc98b7933d5dd77926dd3a2a1cb861a799b50d00201"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-linux-386.tar.gz"
      sha256 "b936902a04a0b24463163c312cf6fdad7e13f0289372a5a47569d7b55e356fca"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-linux-amd64.tar.gz"
      sha256 "ffae363e0afa766bc1dbf73a1b36689128a7ebd750de55c37d2e48b6dc709338"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-linux-arm.tar.gz"
      sha256 "45795463ec98993ccbc157cc2d5e63adea90e44074941e14c88953c0615ec8da"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.4/mailpit-linux-arm64.tar.gz"
      sha256 "705b7cb310df0ec14e7644b94a2382509585d6346dad32d7cd54c903534cec67"

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

class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.11"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-darwin-amd64.tar.gz"
      sha256 "fc633ad06e95a3b3ca5e059d3919d23e7919461e5231aa1b2c2bdfdf958fd186"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-darwin-arm64.tar.gz"
      sha256 "4f7cf8f10783c34210942b3ce39a0be6c5651fe3509137fff547a05cc8bb9b6f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-linux-386.tar.gz"
      sha256 "e5bae49833922c6180afd38f08738d392e51d58f07a9bdba40ca132a2a209943"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-linux-amd64.tar.gz"
      sha256 "b8977074227ed826109acf96e0c1b823e6ad278d1319e0ccb5024d9c25beae88"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-linux-arm.tar.gz"
      sha256 "1e904deec97fd78eccd072c0e656ffa13a623ab685a18ca8a83a044ace381bfc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.11/mailpit-linux-arm64.tar.gz"
      sha256 "5cdff2741794449fadb2554ca932eaff8bedcd909474159593525996b6cccfa3"

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

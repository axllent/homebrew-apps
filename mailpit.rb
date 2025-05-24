class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.25.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-darwin-amd64.tar.gz"
      sha256 "c1d67f64e6aadcd33fa15bbb214c1495dd5bb1b8b3bea9187364f7c78cc1987c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-darwin-arm64.tar.gz"
      sha256 "2e59a79ccbbb2472c1d8eeeba3dcda962df29e82b1ce645d9c1734c7d09c9f8f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-linux-386.tar.gz"
      sha256 "0c97cfb86c053ea6df2d7cb6c019f799b9de30c4191e97b5efcdfce210c44dbf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-linux-amd64.tar.gz"
      sha256 "c9d1cafd7295b041503bf9c081be497825a995d80e78d4b5773e857d60d8b13c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-linux-arm.tar.gz"
      sha256 "d4f53b8a087b1700313ce09a0450b4913e4eeb03ea35848eaf406a18b38f852c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.1/mailpit-linux-arm64.tar.gz"
      sha256 "95f4289e3dbe57a9a196138492c00b061dacbe972a4b528c4087af011005d451"

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

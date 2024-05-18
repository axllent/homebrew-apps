class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.18.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-darwin-amd64.tar.gz"
      sha256 "03e29451f0ed324345c42c8aacf5e22e32a771b50c32ca47bb214a5b8972c814"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-darwin-arm64.tar.gz"
      sha256 "6a8d81a698670284812f71c7d87b95a70e60e52c73466f9c389d424bdf9ee802"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-linux-386.tar.gz"
      sha256 "489430dea6e953e90e82efb0824d584f1235af3c357b8893ac4c1dcf530f30de"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-linux-amd64.tar.gz"
      sha256 "38591f258c86de2cbb3955326e8ecff926a2d8fc94596c4bd604b4b6edfdff5e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-linux-arm.tar.gz"
      sha256 "b45fd62014c995720fd3a83da27304c0d0deb4b9f745b406be5b23ebf2a7ea9f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.3/mailpit-linux-arm64.tar.gz"
      sha256 "42f18da9f4c9936f86484da1ae32cbe2f765ccff26e7282c20604fdbac93a52a"

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

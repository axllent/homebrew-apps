class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.4.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-darwin-amd64.tar.gz"
      sha256 "b43008b79eb257601035cec477922d45e0eede1984a1e903dd535f147545b801"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-darwin-arm64.tar.gz"
      sha256 "ab64163faa180723def975ff9623eb7ddb199798ed8cec20daff49fcc61b395e"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-linux-386.tar.gz"
      sha256 "cb32e1a8f2508e4e4830cbaded791d01904eadc1063f26a30310bae51fdddb57"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-linux-amd64.tar.gz"
      sha256 "ae3835e4173b21700c77466e86e10df28b59e218fedb5a042b78a5850a1caa5a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-linux-arm.tar.gz"
      sha256 "90dfb10d1bc31cf438f2aa59d8346ed6b74363cb4c057e11c39ced8a5c69e8c4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.4.0/mailpit-linux-arm64.tar.gz"
      sha256 "8e92f1c19e8fd489d358313a4b36277f5e29329f4afeeb9d49c64ee80230b46e"

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

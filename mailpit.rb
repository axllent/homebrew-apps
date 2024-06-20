class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.18.6"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-darwin-amd64.tar.gz"
      sha256 "e013414076b613bd36eaa85d0589a57f0fe1bfc56119a7dc5613eb5838fe9947"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-darwin-arm64.tar.gz"
      sha256 "26f3069dac89cd288dc4839109a45cba7bb6a8e5a6fe54c2454b6a9908d98bae"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-linux-386.tar.gz"
      sha256 "c7de114d477a8b116d732c4adbbee0a3fa29ca5da589ed959ae14b1cb4b2649b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-linux-amd64.tar.gz"
      sha256 "1e268331afe5682b9a0f12cb9b9577748da373be16ae056add0c276b2081a887"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-linux-arm.tar.gz"
      sha256 "205cf765fc0c1f37a1baaeebea430ffae758be64056dd9a78a00c0b45058f563"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.6/mailpit-linux-arm64.tar.gz"
      sha256 "a11b14caf34fa4195c8c048756a7658a1b963893324438aaedba71aaf13cf41a"

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

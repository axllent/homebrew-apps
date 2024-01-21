class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.13.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-darwin-amd64.tar.gz"
      sha256 "12fb7974bef044ffe237760cb667dc5256e8f05bcb79f229ec9e259da9b46cb6"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-darwin-arm64.tar.gz"
      sha256 "db343a4b8fb68d2fc79d7338885a6337755177e1fd665bf442b594b43fca0a41"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-linux-386.tar.gz"
      sha256 "5d63b7fe78b0facfa037f37593e9b3fae4d9121ef7dfca08502115bff5b8a876"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-linux-amd64.tar.gz"
      sha256 "cf4eea6ef8bce3b5e32266a0f05782b1feff5ae3becd75e9b10a6c564f53d641"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-linux-arm.tar.gz"
      sha256 "1222194cdbfee8d70f4322c5fabed6f0aaec91b95ac2669cd5b38799d74b41d7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.0/mailpit-linux-arm64.tar.gz"
      sha256 "7b28af2bf7216c6409a8f13b93937ee70c975f93bc3dfc51a939d142274bd856"

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

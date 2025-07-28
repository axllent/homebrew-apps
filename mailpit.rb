class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-darwin-amd64.tar.gz"
      sha256 "9472f27b6e9729441e9e7bec94f80f6aab80d46dbba8dbdda588f71bacb34c01"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-darwin-arm64.tar.gz"
      sha256 "88a18edde9d3bad2b498cd569ea5c6a480441337cc06b91d540a373118c791d2"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-linux-386.tar.gz"
      sha256 "7aa01b301aac0c1df5b3e998822c8b7e89d8fb960c7b798a11621e3986f133c8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-linux-amd64.tar.gz"
      sha256 "b3f2a045a6e17e46aa198e02d59e36eab87152c56fc235543ede23f111933a6f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-linux-arm.tar.gz"
      sha256 "1a58b1268e7f1a245bb992ff694df09a19969438cf1747299b3d83509cf6944d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.3/mailpit-linux-arm64.tar.gz"
      sha256 "c34bf85dc52c421ee1a8463fdb5087d5380c041013da5081f458e5cae3249192"

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

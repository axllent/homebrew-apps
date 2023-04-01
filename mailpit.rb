class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-darwin-amd64.tar.gz"
      sha256 "b7a1264e51be5d44ce085807b11aba4d36e9f416d987f7bdb85c38e578e6685a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-darwin-arm64.tar.gz"
      sha256 "a0eee12675272f326bd97209f302adc90b227efcded1b9fd86472f49a8173006"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-linux-386.tar.gz"
      sha256 "21cc10f1e78c1c62acec65bd6b3921db1f3bedc80472ad35f284b82ba0e3dbe2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-linux-amd64.tar.gz"
      sha256 "c5a73aceaf9bec665bd2c44c3a4eda63784e5b36db3ee5aaef1061e4504b2e96"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-linux-arm.tar.gz"
      sha256 "711a96ad6f4cda123597a35fd27ca2f2ee61f32935d074003a5095e8fa32ba55"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.3/mailpit-linux-arm64.tar.gz"
      sha256 "f84b473bd48d0829283f1c776078b4f248d1112f9d50ef4d6d28d38eda803b47"

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

class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-darwin-amd64.tar.gz"
      sha256 "6abb5e8aa3f11597553a734e182caab5f739a646c8cc02cada79e879cd2d8dae"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-darwin-arm64.tar.gz"
      sha256 "9fa8eec2c73ae4cfc88c907d7def721e611464ed7f4896e39d6d547702cfb0bc"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-linux-386.tar.gz"
      sha256 "15ceaba6f54b0457dde96d4406d3bb2e2e9aac52dbe2bec7ef6ccb178ef5dc62"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-linux-amd64.tar.gz"
      sha256 "44b24c844d2c24f24dad2f202af1c8ffc392e613cf540f69c4e9acce4d8ee15c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-linux-arm.tar.gz"
      sha256 "3ea9dea1c49628aea91cbebc24305347f5dd2905d9af1ffb675bc9f433e960b4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.1/mailpit-linux-arm64.tar.gz"
      sha256 "1980b00dc4fb7bdcf7fc70cf0036a96a4cc4da50ef0dede7b6b88c1dd021773f"

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

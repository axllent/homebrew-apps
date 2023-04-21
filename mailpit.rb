class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-darwin-amd64.tar.gz"
      sha256 "2e02baeb347891de7fc7a0231a1266a59ae3b9b516e3e3c60a6d6b270ed07aa7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-darwin-arm64.tar.gz"
      sha256 "b822adad6f3b9629ba602be77e6ceca0fc89ff55a4fd9cc958c4a7e8e9dcad55"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-linux-386.tar.gz"
      sha256 "5425ba0269546126f778792f9bd5aeb4970e0a19f723c0103ab1be9dc5f0c07b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-linux-amd64.tar.gz"
      sha256 "f383a6329a7b4a702de236271de5becc330bad8355718c7993b2b3e20ec85e7b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-linux-arm.tar.gz"
      sha256 "974ef9ba64129ff57d2b2905cf2af14a009f44a7156a2bb0f30e6c20262db4ed"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.1/mailpit-linux-arm64.tar.gz"
      sha256 "dfc2ad7380e1c4e5eadbd9426f86eaa748c2d62160c8503280057b04a7854286"

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

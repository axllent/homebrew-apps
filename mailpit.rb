class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.10.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-darwin-amd64.tar.gz"
      sha256 "0619dd686218426931f311b055908e111a2960253a727387141d8eaddb2dcde1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-darwin-arm64.tar.gz"
      sha256 "8fbe47d031fbc90e01c67c5b62d63fe755f1386c1180e328f6ebdb1bc4ea2b2d"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-linux-386.tar.gz"
      sha256 "c5be3b667588444a4b65790c324e0070573bc5054455d7e28c194cc851ad1629"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-linux-amd64.tar.gz"
      sha256 "eab2aa9d7d60ecead11048232e8bffd31555401ea3bbe7b21210fa795c8ee4d1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-linux-arm.tar.gz"
      sha256 "a32009e747569234f4c86714af78a8652912326f38f70da131ce616202461ae7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.10.0/mailpit-linux-arm64.tar.gz"
      sha256 "d0c3e6f72697971e87a4bf69efabf2db01338b3b697734da6a5419a3a189c991"

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

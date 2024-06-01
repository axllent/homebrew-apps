class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.18.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-darwin-amd64.tar.gz"
      sha256 "522454a2a9ed3abad27852337ae166ff99be63b6a1f1e9785f3882e27a941f61"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-darwin-arm64.tar.gz"
      sha256 "61f67db5a260e9f62833ea65e9732b2ed2954ce8f79620c96e9b85303ec36007"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-linux-386.tar.gz"
      sha256 "379fb27b92db591938717aeda67541c7c676ef2be71019e70a379aa9f1bbbc31"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-linux-amd64.tar.gz"
      sha256 "2aef81562f9a43693da8c400a41df69f67d75e5cec5d91a45f7078a12ba32e11"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-linux-arm.tar.gz"
      sha256 "e3bbd46c60fde7356afba0aadbd0fac00c57f55a7342582c4367fd21454cd19f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.4/mailpit-linux-arm64.tar.gz"
      sha256 "76b902d6e37e8b4fea534ffb0d49e8cad064ff55438e4a17645629049dfa5b3b"

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

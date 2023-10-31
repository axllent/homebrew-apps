class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.10"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-darwin-amd64.tar.gz"
      sha256 "65491e48d43a77bdc57850eac0726719b2454e6b8c6dac6627ef5d0d6eff32ef"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-darwin-arm64.tar.gz"
      sha256 "78e9f9833c0f03b25cba9d24c91ed38e37fe6117a9202cf951782b7380cdfadb"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-linux-386.tar.gz"
      sha256 "320c4cf711d7038d97fe76735e3bc1814663082caed03e07e13b3f773583afd5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-linux-amd64.tar.gz"
      sha256 "820f60500e083169db4e319efc2223b8d684aec1b100cc1dc7d1f756a9bf6699"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-linux-arm.tar.gz"
      sha256 "25d38b8dfad50889f8f8ccbd976a0317408aded4e2e68bbd37ab3c551f440da5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.10/mailpit-linux-arm64.tar.gz"
      sha256 "40ef50edb35faf7e8f1159f8333970871c9e2a1fa3758d59fa770d9e86801289"

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

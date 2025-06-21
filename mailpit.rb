class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.26.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-darwin-amd64.tar.gz"
      sha256 "5e3c8b5e5f60fff92449938f4ccf065142c8906ed274a84a31f72b6b39129016"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-darwin-arm64.tar.gz"
      sha256 "39d10cb26b65a2b4efe93b1aaca8955227464b27e31490aff964cb5a07818ab2"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-linux-386.tar.gz"
      sha256 "71d04182b0d769efc3420b34cc33400f50d5f1a5b4764bfe3b6217ff7959f36f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-linux-amd64.tar.gz"
      sha256 "b1cb724f1d19f6e21e6c3352cf53edbc41dcdfdcea26552cf0b563f39fa6be3a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-linux-arm.tar.gz"
      sha256 "ca8ea8146d7d442991f44946537bbee74c13f7ec72dcbe6171b9da52ef8fb302"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.2/mailpit-linux-arm64.tar.gz"
      sha256 "63c1ebe05ca8f8ab2a1692002db2d8183b4576d67fe060d574e0d361e6ac3e16"

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

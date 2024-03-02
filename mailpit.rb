class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.14.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-darwin-amd64.tar.gz"
      sha256 "c2766dd8672f2ff5955de28c35869c6739464e617c3b7b16a0f6d5190e861a31"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-darwin-arm64.tar.gz"
      sha256 "55ae381a9605bf794abdc6b979ba6608cc673113bd4df7abbd500bca1c9631d3"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-linux-386.tar.gz"
      sha256 "2490741ff29f6acc5c69e4ef0c1105ea734807dea2433e665dee6a3f07483b65"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-linux-amd64.tar.gz"
      sha256 "e9062eec62bf5ede6a23b1a41da2cf641434a2302ae873498020bc73a6d18ddd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-linux-arm.tar.gz"
      sha256 "e4ec5ecb1527f44e249ed9196763acc63310087a06a79f0c4c18e3a9158a822d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.1/mailpit-linux-arm64.tar.gz"
      sha256 "44cd6c5578c90804441658221e3ed478faf5892dc97d57a0dcf5ccf25cc8226a"

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

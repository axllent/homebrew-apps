class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.17.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-darwin-amd64.tar.gz"
      sha256 "9f2730c94d0232ab191cf70448f67cfa87eebb57788bd92f881236655436cc82"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-darwin-arm64.tar.gz"
      sha256 "28308b32b6c1c40c276316632d96d692c64ced2fa24aacad4fca42f0cc682764"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-linux-386.tar.gz"
      sha256 "ddfee79ba591091aa7b066de2970573cf196de6cbb1563d7220e5bbcd295e9fd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-linux-amd64.tar.gz"
      sha256 "6255e3b4c753e54bd00a1af3acd8c999c307ee488eba0ee88ad497fcbd84e70f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-linux-arm.tar.gz"
      sha256 "9f5ac96a98fea37f188e5b69dd74afa1610c39e1104fd3c07b370a26c5846053"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.17.1/mailpit-linux-arm64.tar.gz"
      sha256 "3f5e1a2831e78f6d3178dc7a2d8654b3e9b03656b6dfddd476139439b16869ae"

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

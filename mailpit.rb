class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-darwin-amd64.tar.gz"
      sha256 "7871bb6292e6da04e77e810dda51e034f33a0dfbb05f63565dd9b5f5071a3272"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-darwin-arm64.tar.gz"
      sha256 "5932271129206da1e75964ebd2fc6a3500fba0385dfb6116d58fc5e0d1e5ad86"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-linux-386.tar.gz"
      sha256 "12ccc33be8090d59fab21155c48bee46858ab6d58bd0f27ec95bf37491c3a687"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-linux-amd64.tar.gz"
      sha256 "d3a23ab0f8402890fdf9f9d10382a860c147730a0b15deadc40a5f3f26bb6a16"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-linux-arm.tar.gz"
      sha256 "b374ea3d38d7721ff404c5736a5bf5c86efe79d5a80df9d3e340eb88f20c1ecf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.0/mailpit-linux-arm64.tar.gz"
      sha256 "fcaea647f11049f62ce246c14732d3cb36de7baeb897654f05973308b6dee5a3"

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

class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-darwin-amd64.tar.gz"
      sha256 "14878297a35a21e40a91462f9da542d62f4036a0e998e92049ec5a16bcb5ba08"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-darwin-arm64.tar.gz"
      sha256 "89e79aa61d8812f39534d9548821e7a51b04da4e84de8b73608783de47fb3a0b"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-linux-386.tar.gz"
      sha256 "32b5c8de5355c4bfb84b032bec71077dcc4302e3e152d4e89660229781e82afc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-linux-amd64.tar.gz"
      sha256 "20be03086435c99a8e60e979246969741dc9da2d21e2da5d5574d28b106a19f9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-linux-arm.tar.gz"
      sha256 "17f51d24a0a2aa4ee89b6fa0c8328cfc4f6345d2362ce5d236fba9bf66dedc5c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.3/mailpit-linux-arm64.tar.gz"
      sha256 "2813875632a030d1cd05deb915d9f45debec92e6045094364861477c80dd9f97"

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

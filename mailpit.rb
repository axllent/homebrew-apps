class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.22.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-darwin-amd64.tar.gz"
      sha256 "839ad8b5d252575d205c61b5554cf2da6f8026a46762b1b15722765178276b73"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-darwin-arm64.tar.gz"
      sha256 "1589631192c37ca4eed131dfbe512ad69700a4f109ca062bdcf2fa98ed67dde7"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-linux-386.tar.gz"
      sha256 "304b3ad58b320e2fb494d4461098f7f6700d0a40bd4efd513725b560fd5aaa0f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-linux-amd64.tar.gz"
      sha256 "5fa2690cf4785a15007173677c9fdfb0ef1d15fbea90250371a09cbb8709d762"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-linux-arm.tar.gz"
      sha256 "6382ca9d21a3b9611f077d001edefb95db89366dc0536310d4f8934cbffdb960"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.2/mailpit-linux-arm64.tar.gz"
      sha256 "aedc0ba24aa828177994ca81b4d574bd89d04ddb312021d7f673204d8f79def5"

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

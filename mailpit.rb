class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.10"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-darwin-amd64.tar.gz"
      sha256 "d304a29dc90a8bb322394b4791af17c77f0b9d54a0a41d8cfe77cd19c937d2e4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-darwin-arm64.tar.gz"
      sha256 "22b3f0aaa38837d4efc83ecfb19f21ae6f4dead6ca20e0a95a53f508d168122f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-linux-386.tar.gz"
      sha256 "4357a174ff00826882cb88ce93a67d03f16f22221662e15dab2fe0cee110815f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-linux-amd64.tar.gz"
      sha256 "c40d8105569e826cfdc00e897ad81f13e7a8f8f7298df347554222bc9ae2f4b4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-linux-arm.tar.gz"
      sha256 "b224f01b63f41bba5536822ba6ec4f13a4715added5b21f3c35ba60e7136ae3c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.10/mailpit-linux-arm64.tar.gz"
      sha256 "59dc4d19dfd961794c9543e32e5ad3a938ce2e874487d6a63fce7a81be9d106d"

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

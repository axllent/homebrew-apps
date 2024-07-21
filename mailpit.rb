class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.19.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-darwin-amd64.tar.gz"
      sha256 "3b975dd788680305ea789898772e500aa78ad51903c0f51627444770ebfdc339"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-darwin-arm64.tar.gz"
      sha256 "6d3b57d4753a875fc3962403847cd12462f4f799e733e7c656547662385d90f8"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-linux-386.tar.gz"
      sha256 "1e0d396920158138442b5d137c620e8af5cbfd9a24b099d1d872f21eb105a0d0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-linux-amd64.tar.gz"
      sha256 "04788d579e095c6d461fb9786f9435371c610f861b859bce8300d1f1476cbccc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-linux-arm.tar.gz"
      sha256 "a110478b5e26789f354443ab68213056c217bac26a1cf134f7ed488751b38356"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.2/mailpit-linux-arm64.tar.gz"
      sha256 "7f8f67d54edf33e316b994b7ac771d41d6b5f6b35dddc524636f873bd80fff10"

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

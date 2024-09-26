class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.5"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-darwin-amd64.tar.gz"
      sha256 "874f09a985a3836e877aca88ca1c38f1eeeed9335d5e70c51caec81960559149"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-darwin-arm64.tar.gz"
      sha256 "e55c0765084f70c991e67c906549943ac1b3f48a7afbe76f9fba67cd18048e5d"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-linux-386.tar.gz"
      sha256 "531ff07ef667e79d9e9e6e27c3338158ca96144f50295e3f38e8ad9cc7e6def1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-linux-amd64.tar.gz"
      sha256 "d16cc46f3384627acab0df8fb0a22a4888a82972a203ed7e45694ac0de1566bc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-linux-arm.tar.gz"
      sha256 "484e987ae8e0edb35da2f69034b4f4696f34c6840bafc364bf0c69a8a70b70d2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.5/mailpit-linux-arm64.tar.gz"
      sha256 "645d285eb53180f1b52d852ad2ffc06b5bba0ab540911c072844dd40cfa0a918"

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

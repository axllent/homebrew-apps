class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.13.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-darwin-amd64.tar.gz"
      sha256 "192ad68bf99e84fa8cd4701e461e97cd392358862e36658e1c137dc26d5fb13c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-darwin-arm64.tar.gz"
      sha256 "60ae877f761fa5fc768cc71b03abda89a7ffe4e9a319c9fac6a6f49d1b68f2a2"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-linux-386.tar.gz"
      sha256 "4112253c16bf33ae614944934d39d525bbaddd5f939e1f33f7bb480f4eb44f59"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-linux-amd64.tar.gz"
      sha256 "84b5693d7d38c3a98427a40b39b00517769ea1eb91bada83e98a8e8449b3c75b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-linux-arm.tar.gz"
      sha256 "2149cca00f3510d0bfd0610b221878863c0200c2829a1bc23fae4300224bcb0b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.2/mailpit-linux-arm64.tar.gz"
      sha256 "f717f7de9995d6341d6a5630d2e26a4962f123b779bce6b620a598b3c40b5553"

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

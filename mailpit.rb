class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-darwin-amd64.tar.gz"
      sha256 "203636662abee5ce1b00004d2ad4826d4aafd05ab128e4f797f5e20b9032303f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-darwin-arm64.tar.gz"
      sha256 "ae27ca43b419a783a6821780d96fdbfdfada00246146473750a6b511a5470358"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-linux-386.tar.gz"
      sha256 "239eb8eff3bbf7a42ada522680c3491a2c74225b46dc5dea88a42e336b16ad32"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-linux-amd64.tar.gz"
      sha256 "912df4de4c38dacd42369582256eb0fa2df1dca6e01d0e9566e59e7ecb2fd655"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-linux-arm.tar.gz"
      sha256 "ee55fc13783cccb7dfca828cf1b1c053f8afb9d01695e05557d45360a539a0b9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.4/mailpit-linux-arm64.tar.gz"
      sha256 "5785392fc0638e09a99901848400f25841cee7644833a743bf11fcc9452125c7"

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

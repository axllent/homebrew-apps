class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.13.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-darwin-amd64.tar.gz"
      sha256 "fb6ef6b577ced66bdf60be790d9fe3b72b0454f91636d47be85135b91ba2e02d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-darwin-arm64.tar.gz"
      sha256 "4634e3267a87b9e1843684cfca8eb040adebe7e5249b202e17939e643d993499"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-linux-386.tar.gz"
      sha256 "d479e6e175903ecf1f8fbed8f24c928e36fa5b87132a1e44ecf53217deafb7c8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-linux-amd64.tar.gz"
      sha256 "67e68f0cff3cd6b55ed6b9fb630c264ba490c182f9d3f613c5953c5ff2edfd97"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-linux-arm.tar.gz"
      sha256 "ef6cfc481f53a19578fd616e2d0b4876d9d537124238fd481bc36773febe3842"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.13.3/mailpit-linux-arm64.tar.gz"
      sha256 "f26e2be8d7f2f99f66124751a0695cfeff68206f77bb9a4aaba48ba085c30f8e"

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

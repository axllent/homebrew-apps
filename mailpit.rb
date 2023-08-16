class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.8.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-darwin-amd64.tar.gz"
      sha256 "6827c39236088e1406b4a29acc08ae2ba5b46ee522457a9765591bfa5503e26e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-darwin-arm64.tar.gz"
      sha256 "15c92bf0832a511a2f122ca12966e4155f63f2426f103b61e3dced1e1b8fcadc"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-linux-386.tar.gz"
      sha256 "b5b532a6dfadf0e17e8721bb4d0c333acd58a0984eec7bd96d055a3d30a2bb82"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-linux-amd64.tar.gz"
      sha256 "6def4e8a7d86898210cc6dd94f73d3c757af18849cab7ef160202841d335985f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-linux-arm.tar.gz"
      sha256 "c31b54c2f55ae900edc37147a1f3045030b9cd1ef6f2af4e5aab387713c697b4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.2/mailpit-linux-arm64.tar.gz"
      sha256 "fb362647816597a073c65d62443c32e8ac41b84c217b803a9f7841f5dceb7ac2"

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

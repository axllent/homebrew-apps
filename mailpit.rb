class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.5"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-darwin-amd64.tar.gz"
      sha256 "60c2e9ae3474c838c7e9fed79d65b0432caec9f92ecc43bec45730dcce53b7f1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-darwin-arm64.tar.gz"
      sha256 "e9983af8000bdd018068a13aeeee42c7d4482fd6125e2307752b21e6ebc60cf5"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-linux-386.tar.gz"
      sha256 "7275069217441f9305198555b58f29530f04af0fca2521d5d43c6af3f226c448"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-linux-amd64.tar.gz"
      sha256 "458c505d4e98d1fd78e3c64548ddf04d48a86656b401413d6dd4f4847aa422c0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-linux-arm.tar.gz"
      sha256 "0d98925a6bc13510c11079d983bb015bdbc081f5a88f7bb1c6a80a0c5c7fbda8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.5/mailpit-linux-arm64.tar.gz"
      sha256 "24e5d01fabe706054e3f19b81efb5a6b563311929b730af0bbf26d04e7f72508"

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

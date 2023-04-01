class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-darwin-amd64.tar.gz"
      sha256 "5389b1a4f66aa65eac27e93fff35b16cdf68995744216cc1c0edd2b05cdf12e1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-darwin-arm64.tar.gz"
      sha256 "080cfaeb6a8fc4d473b98d7685bbe8c9f7a61158c5b0bfc4da7e6b7daa9f5949"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-linux-386.tar.gz"
      sha256 "4bbc646e312ff6f325d9db1d8d83d0fb81b681971db081b94167f11fd2302074"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-linux-amd64.tar.gz"
      sha256 "ba4b19ae8adc5ee6efe74445a0705cb120c2746748d2d7652f91c732770519c1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-linux-arm.tar.gz"
      sha256 "892b185c111b68c1ee06ac5359ea9e9111f1c07173948606854946b9ec5cc9a1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.2/mailpit-linux-arm64.tar.gz"
      sha256 "b9e107e40c1621e9e42d09cfa9892c766b0ccc108e17acb7e4b4e650544fd5e0"

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

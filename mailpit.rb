class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.3.11"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-darwin-amd64.tar.gz"
      sha256 "2045cb876848c7a74c7fb22ce376c990ffc34a8c82fddaea487ad677e53b4846"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-darwin-arm64.tar.gz"
      sha256 "bea20bd1caad34999fce72b798b149469ca2c1b132e509ccae8a0812a0438958"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-linux-386.tar.gz"
      sha256 "eda06c225eada0591818432dc1d515d3c67052b6070060680925c0adceaa9108"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-linux-amd64.tar.gz"
      sha256 "c847a643e1afb80659f58b5196d666c52f097011940a1e4b8e4293b2ff1cc022"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-linux-arm.tar.gz"
      sha256 "7e327bd75821908808b72ef9bf7734dbd684fc2d2ea727224a4237386716651f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.11/mailpit-linux-arm64.tar.gz"
      sha256 "3da5e830487aa05f8a3d0f97e3c6fae85f4e19721305491f0123d065a4514a7c"

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

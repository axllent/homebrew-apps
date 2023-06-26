class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.22"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-darwin-amd64.tar.gz"
      sha256 "86a1eac310ccf1eab9f00de0afc05c95a64f2b3176713ebfe1cb8fd3dff7a9f7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-darwin-arm64.tar.gz"
      sha256 "2ff27352a1701e456f19e619f465b34af393234017f228f8fec032d34ee6a6bc"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-linux-386.tar.gz"
      sha256 "0d8d9bd4b1af6130405ad55c6efd0f7bf40670b73ead949a28903a5c0a2a5e6d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-linux-amd64.tar.gz"
      sha256 "6dffc3aa2ff98ccd86f9b5f864c55dfa6a778929257a4f14dd1507bb4d38fb54"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-linux-arm.tar.gz"
      sha256 "682100718caafab24ca04dc3efc1ca1f280abc863de1f46ad40753aa9c4fcd6e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.22/mailpit-linux-arm64.tar.gz"
      sha256 "cdfeb4c4295a0a9d66bbedd08a8177930a46adda3cadba8bacb51a23dee8d667"

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

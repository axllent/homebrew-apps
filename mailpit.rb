class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.22.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-darwin-amd64.tar.gz"
      sha256 "391a3c7dbbd9417e70bba55032496a5efa21f3a834e9618ca6b548c63258249e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-darwin-arm64.tar.gz"
      sha256 "11bd367640baa48e15dcb6b790bb401eeb3a299c2491c59f63923b49af81620b"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-linux-386.tar.gz"
      sha256 "140543eaef039f049799398efbeac35afefbdd27427654251e2100932d340713"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-linux-amd64.tar.gz"
      sha256 "a4f4bfb7cfe694c23fadff666255453b4719ce8c3fd7b1d48685a4ab8cbdbad7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-linux-arm.tar.gz"
      sha256 "bb9ef09abd68a252cb2d482337bbd647cbac955a242a7751ea3bebcb97bc6471"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.0/mailpit-linux-arm64.tar.gz"
      sha256 "ff9b82762fee45e31c4cdfa449900ceee7966977489859a59137fb5c93e9af6c"

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

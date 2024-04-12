class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.16.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-darwin-amd64.tar.gz"
      sha256 "e2d588d6ee338556acf51f7ad973eba451bbb46527d0b6749cf46486d173aaee"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-darwin-arm64.tar.gz"
      sha256 "cafa5f010f42afadbd0c3a934c40a89687918196b825266b8144145466fe1760"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-linux-386.tar.gz"
      sha256 "30495fcf61858c09d7bfc96c31ceffb33d2eb97a4fdf232c19b714463c6a7b80"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-linux-amd64.tar.gz"
      sha256 "9d3b1e5930588e8294e4c2901f7c3762af8934edd8123809884837d361b129a4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-linux-arm.tar.gz"
      sha256 "df416fcf3f313c62a5e47d7989a0a6d26672c6387bde944ab4497dc0871ad4f0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.16.0/mailpit-linux-arm64.tar.gz"
      sha256 "48323d99dde955710827ccc828b33683aaf0dddd27e13725e93d476ecda3ed1e"

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

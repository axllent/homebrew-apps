class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-darwin-amd64.tar.gz"
      sha256 "b099f9548c8977617e65543ee07c7e136af3ddcf6cb30fd7eb289d397f865f8d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-darwin-arm64.tar.gz"
      sha256 "6a906d469b172ca8f5ad1262e1dab6a87294a83e55134ba2a82252dd2b742fbf"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-linux-386.tar.gz"
      sha256 "aa8ff97ec6d6392e407595059b424e5746844cfa0487847f9881eadc20f4476c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-linux-amd64.tar.gz"
      sha256 "9fcf0752d483725c4c081a3d5bdd3ad4375ca3d060a8f93cd2d259e3cec8d9c1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-linux-arm.tar.gz"
      sha256 "55f84e4444101c3ae01e1d1c84c0a696b3ec00b650cefd7f5e7cf78214470367"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.7/mailpit-linux-arm64.tar.gz"
      sha256 "9728bd85734c4f9958d8d784eecd2a6021fc3fd2e3f9c7c1b8d2c3c58e168649"

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

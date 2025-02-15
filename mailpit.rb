class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.22.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-darwin-amd64.tar.gz"
      sha256 "a99b3747051eaaf63f7812113c0448289c229019d7ec38d01228ce2de1ae0b24"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-darwin-arm64.tar.gz"
      sha256 "6fc58c2e30d1912a8450ab1a09f17fb943237919271d009eef2eab5157fe50d1"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-linux-386.tar.gz"
      sha256 "ceb74d19a422237a82d932b8e8b3f037ea0bfe031a4cca09ea09db9dbf0241a7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-linux-amd64.tar.gz"
      sha256 "85c7594c3dbdc619f64f9f831534332bc1861d755a9c85b88046be670e2eb0e2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-linux-arm.tar.gz"
      sha256 "e2a74b4df048fd3270740544ced0dafb7b0a8f0e88f48d7bb3acb73843e63724"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.22.3/mailpit-linux-arm64.tar.gz"
      sha256 "db68cd16a67a5c610d07b17c43ec8d5503af8e8d03f7e2b0945cdb57dbdefe67"

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

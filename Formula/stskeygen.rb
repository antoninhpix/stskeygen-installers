# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stskeygen < Formula
  desc "A commandline utility for trading directory service credentials (such as AD username and password) for AWS STS Keys."
  homepage "https://support.cimpress.cloud/hc/en-us/articles/227873908"
  version "2.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.8/stskeygen_2.2.8_Darwin_x86_64.tar.gz"
      sha256 "3908a0438003ef4ac0fd609f3bca5473405ec13bd69c2bb7b050d838671f9cc0"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.arm?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.8/stskeygen_2.2.8_Darwin_arm64.tar.gz"
      sha256 "880ca7fd363b25071ea3aa57250cfc7ddf8a86fab90b42b664f6a6bb96ff9975"

      def install
        bin.install "stskeygen"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.8/stskeygen_2.2.8_Linux_x86_64.tar.gz"
      sha256 "f709163efa8ef029e69634d3804232fce1228f1283c05837f3f1d900c73cdb06"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.8/stskeygen_2.2.8_Linux_arm64.tar.gz"
      sha256 "5f932b5cbd22b9fcce05113b649d73985dc7970dabc1fcda0d192d437fc3cd5e"

      def install
        bin.install "stskeygen"
      end
    end
  end

  test do
    system "#{bin}/stskeygen"
  end
end

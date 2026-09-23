# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogAnalyzer < Formula
  include Language::Python::Virtualenv

  desc "Log analysis and threat correlation engine for authorized security reviews"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-analyzer"
  url "https://files.pythonhosted.org/packages/e4/a5/97f0b9e9e03d09813aec8df35a3057d3fd2a1f266eae32c25962b0441202/vamp_log_analyzer-2.1.tar.gz"
  sha256 "443b4c0a93a0bdf0f1429fb2644857b6b6dcb91906b82718c057f2c00241d33a"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-analyzer==2.1"
    bin.install_symlink libexec/"bin/vamp-log-analyzer"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-analyzer --help 2>&1")
  end
end

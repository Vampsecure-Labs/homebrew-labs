# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogAnalyzer < Formula
  include Language::Python::Virtualenv

  desc "Log analysis and threat correlation engine for authorized security reviews"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-analyzer"
  url "https://files.pythonhosted.org/packages/3e/76/d0d2f685a3ba2534e602169cf71e3f737d8de7ba9122d72598d8ace1ce3e/vamp_log_analyzer-2.0.tar.gz"
  sha256 "6b4d840d1ec629089bb3b173881946302526307e6f44306087af144f75065b7a"
  license "MIT"
  version "2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-analyzer==2.0"
    bin.install_symlink libexec/"bin/vamp-log-analyzer"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-analyzer --help 2>&1")
  end
end

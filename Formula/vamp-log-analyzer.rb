# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogAnalyzer < Formula
  include Language::Python::Virtualenv

  desc "Log analysis and threat correlation engine for authorized security reviews"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-analyzer"
  url "https://files.pythonhosted.org/packages/source/v/vamp-log-analyzer/vamp_log_analyzer-2.4.0.tar.gz"
  sha256 "f821356e411fcc31ece19872842cd1b75b0132fc304017d4d6b1a26860f785bb"
  license "AGPL-3.0-only"
  version "2.4.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-analyzer==2.4.0"
    bin.install_symlink libexec/"bin/vamp-log-analyzer"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-analyzer --help 2>&1")
  end
end

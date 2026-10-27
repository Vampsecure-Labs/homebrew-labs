# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogHunter < Formula
  include Language::Python::Virtualenv

  desc "Log hunting and threat-pattern scanner for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-hunter"
  url "https://files.pythonhosted.org/packages/f3/47/d181b6d89d87621a62a02447bdeed51e0c5fc7d0eaeb3e667866e1e70df8/vamp_log_hunter-1.4.tar.gz"
  sha256 "2f1c2091d4904be21bcbdbc71fba93fb2ce7507dde8d2089c67e22da999a8509"
  license "MIT"
  version "1.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-hunter==1.4"
    bin.install_symlink libexec/"bin/vamp-log-hunter"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-hunter --help 2>&1")
  end
end

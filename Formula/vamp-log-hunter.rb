# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogHunter < Formula
  include Language::Python::Virtualenv

  desc "Log hunting and threat-pattern scanner for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-hunter"
  url "https://files.pythonhosted.org/packages/f3/47/d181b6d89d87621a62a02447bdeed51e0c5fc7d0eaeb3e667866e1e70df8/vamp_log_hunter-1.3.tar.gz"
  sha256 "771a561ddc63197df548f862e848e16723ae826710d0924aaac6137efc085da7"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-hunter==1.3"
    bin.install_symlink libexec/"bin/vamp-log-hunter"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-hunter --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogHunter < Formula
  include Language::Python::Virtualenv

  desc "Log hunting and threat-pattern scanner for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-hunter"
  url "https://files.pythonhosted.org/packages/c4/42/7759376872f1b4d35dc86c6d7a7021b1e052a604b11278387dda4fd91ddd/vamp_log_hunter-1.2.tar.gz"
  sha256 "dc2b5c1474a476bee82d91f7de95bbda0949d1e1efc3458dbdefd8330043a81f"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-hunter==1.2"
    bin.install_symlink libexec/"bin/vamp-log-hunter"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-hunter --help 2>&1")
  end
end

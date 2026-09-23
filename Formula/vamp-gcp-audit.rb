# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Google Cloud Platform security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-gcp-audit"
  url "https://files.pythonhosted.org/packages/a3/bb/1931ea15b9378fa3049c8e13a106944cae5cd403f8e3a9e0796d53130333/vamp_gcp_audit-1.2.tar.gz"
  sha256 "3db9a495778558a63c1f46a75d896f511423f97f7866f10b1ea4c7288ccc1d69"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-gcp-audit==1.2"
    bin.install_symlink libexec/"bin/vamp-gcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-gcp-audit --help 2>&1")
  end
end

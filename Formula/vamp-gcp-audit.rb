# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Google Cloud Platform security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-gcp-audit"
  url "https://files.pythonhosted.org/packages/d3/ef/e454795dd5592920b1eb9ec056e171734218b9400f7ae615ce8d7aa58f63/vamp_gcp_audit-1.1.tar.gz"
  sha256 "6de13f8e31cf173246b5355ff9132abb8af14336c56ab27dcfe1f531bed4696b"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-gcp-audit==1.1"
    bin.install_symlink libexec/"bin/vamp-gcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-gcp-audit --help 2>&1")
  end
end

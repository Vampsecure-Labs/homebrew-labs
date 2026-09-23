# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMailAudit < Formula
  include Language::Python::Virtualenv

  desc "Email infrastructure and SPF/DKIM/DMARC auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-mail-audit"
  url "https://files.pythonhosted.org/packages/79/83/a1707e8f67a8f95946945c8d3826a8ad417d2c1437c78f81542d653e8894/vamp_mail_audit-1.1.tar.gz"
  sha256 "083c78b3ab389226c12833f624611d47a2da0fc870c84108b0c1252fd300243c"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mail-audit==1.1"
    bin.install_symlink libexec/"bin/vamp-mail-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mail-audit --help 2>&1")
  end
end

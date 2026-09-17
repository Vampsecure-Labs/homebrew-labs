# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMailAudit < Formula
  include Language::Python::Virtualenv

  desc "Email infrastructure and SPF/DKIM/DMARC auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-mail-audit"
  url "https://files.pythonhosted.org/packages/a1/72/4849bb3d1a61471731ae05b7d90e7c6b54853f7e01270a77060ae3380e58/vamp_mail_audit-1.0.tar.gz"
  sha256 "f2bc5dff93a988287df3115baea91c20d9e7ae11d75226a1a71815024b07e3d4"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mail-audit==1.0"
    bin.install_symlink libexec/"bin/vamp-mail-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mail-audit --help 2>&1")
  end
end

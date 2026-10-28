# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMobileAudit < Formula
  include Language::Python::Virtualenv

  desc "OWASP MASVS 2.0 static auditor for APK and IPA files"
  homepage "https://github.com/Vampsecure-Labs/vamp-mobile-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-mobile-audit/vamp_mobile_audit-1.2.tar.gz"
  sha256 "787c5206ad315b9039081edc26773dc41ab52eb23d7094d8bb1166caba7b1769"
  license "AGPL-3.0-only"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mobile-audit==1.2"
    bin.install_symlink libexec/"bin/vamp-mobile-audit"
  end

  test do
    assert_match "vamp-mobile-audit", shell_output("#{bin}/vamp-mobile-audit --help 2>&1")
  end
end

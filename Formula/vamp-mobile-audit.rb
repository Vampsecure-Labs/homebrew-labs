# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMobileAudit < Formula
  include Language::Python::Virtualenv

  desc "OWASP MASVS 2.0 static auditor for APK and IPA files"
  homepage "https://github.com/Vampsecure-Labs/vamp-mobile-audit"
  url "https://github.com/Vampsecure-Labs/vamp-mobile-audit/releases/download/v1.0.0/vamp_mobile_audit-1.0.0.tar.gz"
  sha256 "6f562f25be7b384479525b649a9c6c873f6d00b70837ebcf05bc93ebdd0603ef"
  license "AGPL-3.0-only"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "vamp-mobile-audit", shell_output("#{bin}/vamp-mobile-audit --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMobileAudit < Formula
  include Language::Python::Virtualenv

  desc "OWASP MASVS 2.0 static auditor for APK and IPA files"
  homepage "https://github.com/Vampsecure-Labs/vamp-mobile-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-mobile-audit/vamp_mobile_audit-1.0.0.tar.gz"
  sha256 "7a631bed26c7b65bbaf8572aaf161d25fb6e94fed9cd4376d37b6ee209675b8a"
  license "AGPL-3.0-only"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mobile-audit==1.0.0"
    bin.install_symlink libexec/"bin/vamp-mobile-audit"
  end

  test do
    assert_match "vamp-mobile-audit", shell_output("#{bin}/vamp-mobile-audit --help 2>&1")
  end
end

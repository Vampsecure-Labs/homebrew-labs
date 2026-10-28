# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWindowsAudit < Formula
  include Language::Python::Virtualenv

  desc "Windows Security Configuration Auditor — 15 CIS checks for authorized security testing"
  homepage "https://github.com/Vampsecure-Labs/vamp-windows-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-windows-audit/vamp_windows_audit-1.1.2.tar.gz"
  sha256 "ab51915ea31e866fa73c4e418eaeac4da699a7250cebb20f9abff3c2ee8c806a"
  license "AGPL-3.0-only"
  version "1.1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-windows-audit==1.1.2"
    bin.install_symlink libexec/"bin/vamp-windows-audit"
  end

  test do
    assert_match "vamp-windows-audit", shell_output("#{bin}/vamp-windows-audit --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWp2shellAudit < Formula
  include Language::Python::Virtualenv

  desc "WordPress upload-vector and webshell auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-wp2shell-audit"
  url "https://files.pythonhosted.org/packages/b2/fd/b8a2b2e5165682506059d10e32cd96300905a024c01edfac2d48099da4c9/vamp_wp2shell_audit-1.0.tar.gz"
  sha256 "c9d2bc70c88074e1cabe96e6ea3c820a3732df72bebd4599dcda4d482f630049"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-wp2shell-audit==1.0"
    bin.install_symlink libexec/"bin/vamp-wp2shell-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-wp2shell-audit --help 2>&1")
  end
end

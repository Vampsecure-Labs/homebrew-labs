# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWp2shellAudit < Formula
  include Language::Python::Virtualenv

  desc "WordPress upload-vector and webshell auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-wp2shell-audit"
  url "https://files.pythonhosted.org/packages/02/33/3823d45ead0d9d52c7cef0803ce37b22a6a52edf059b913f5220e7699651/vamp_wp2shell_audit-1.1.tar.gz"
  sha256 "d0bf9439556e688c01395267cb29f217c66e267a014b0d0d0685d04d5edfb88f"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-wp2shell-audit==1.1"
    bin.install_symlink libexec/"bin/vamp-wp2shell-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-wp2shell-audit --help 2>&1")
  end
end

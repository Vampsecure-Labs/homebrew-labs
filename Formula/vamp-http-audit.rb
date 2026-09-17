# © VampSecure Studios — VampSecure Labs Security Research Division
class VampHttpAudit < Formula
  include Language::Python::Virtualenv

  desc "HTTP security headers and CORS auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-http-audit"
  url "https://files.pythonhosted.org/packages/f9/ce/3c6c890d2f555ad4bbd2129cb8f8fe280510f945b25c4b17711d7a2a5b3e/vamp_http_audit-1.1.0.tar.gz"
  sha256 "0a7c677cae1616b9199fb21cae9b850920c0c8fcaed66bde86d2a934af0583f9"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-http-audit==1.1.0"
    bin.install_symlink libexec/"bin/vamp-http-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-http-audit --help 2>&1")
  end
end

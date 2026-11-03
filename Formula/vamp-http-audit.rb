# © VampSecure Studios — VampSecure Labs Security Research Division
class VampHttpAudit < Formula
  include Language::Python::Virtualenv

  desc "HTTP security headers and CORS auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-http-audit"
  url "https://files.pythonhosted.org/packages/6a/bd/17462c510a35bcbae1e65ea9934d4969457b266a8ff9eb77c532a6d7078a/vamp_http_audit-1.7.0.tar.gz"
  sha256 "e32780adb28d076a160ee176aa8af3bcc3edbf2879497b9732550e59eb732406"
  license "MIT"
  version "1.7.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-http-audit==1.7.0"
    bin.install_symlink libexec/"bin/vamp-http-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-http-audit --help 2>&1")
  end
end

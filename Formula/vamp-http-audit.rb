# © VampSecure Studios — VampSecure Labs Security Research Division
class VampHttpAudit < Formula
  include Language::Python::Virtualenv

  desc "HTTP security headers and CORS auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-http-audit"
  url "https://files.pythonhosted.org/packages/81/19/7968daa74f0f728bb49c958b2d50cd80b826019eaa4d41fb2d4511333e21/vamp_http_audit-1.0.0.tar.gz"
  sha256 "46f25313a5f2a6cf2085af1bd77f0f357febb867a517585ff5806fd59c4c0bd6"
  license "MIT"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-http-audit==1.0.0"
    bin.install_symlink libexec/"bin/vamp-http-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-http-audit --help 2>&1")
  end
end

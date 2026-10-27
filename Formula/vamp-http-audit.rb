# © VampSecure Studios — VampSecure Labs Security Research Division
class VampHttpAudit < Formula
  include Language::Python::Virtualenv

  desc "HTTP security headers and CORS auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-http-audit"
  url "https://files.pythonhosted.org/packages/6a/bd/17462c510a35bcbae1e65ea9934d4969457b266a8ff9eb77c532a6d7078a/vamp_http_audit-1.5.1.tar.gz"
  sha256 "583eacf71d9978e0e62f85c59045c9bd20f0deffd37fbfe9e481df7d4a89da7d"
  license "MIT"
  version "1.5.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-http-audit==1.5.1"
    bin.install_symlink libexec/"bin/vamp-http-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-http-audit --help 2>&1")
  end
end

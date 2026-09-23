# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSslAudit < Formula
  include Language::Python::Virtualenv

  desc "TLS/SSL security auditor — protocol version, cipher suites, certificate validity, HSTS preload"
  homepage "https://github.com/Vampsecure-Labs/vamp-ssl-audit"
  url "https://files.pythonhosted.org/packages/01/b2/9cefa7c336b15f9cc92fb9d90c69fc3f58c573d0a93a421e3d566670dc12/vamp_ssl_audit-1.2.0.tar.gz"
  sha256 "2bd6338d0602afb83afb9c725f27e58dc955090416d37d212109a2711d2fce9d"
  license "MIT"
  version "1.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ssl-audit==1.2.0"
    bin.install_symlink libexec/"bin/vamp-ssl-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ssl-audit --help 2>&1")
  end
end

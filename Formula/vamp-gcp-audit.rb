# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Google Cloud Platform security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-gcp-audit"
  url "https://files.pythonhosted.org/packages/58/a5/5ff58943a53f4cee97abe10b38e39eafb2deeda635cd9e05216476701ef5/vamp_gcp_audit-1.0.tar.gz"
  sha256 "954a7e368786aaccb0e82f3524201b46ebe52d371b59e49865521768a2a7cad4"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-gcp-audit==1.0"
    bin.install_symlink libexec/"bin/vamp-gcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-gcp-audit --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Google Cloud Platform security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-gcp-audit"
  url "https://files.pythonhosted.org/packages/af/30/c8d8f83f4491831734d5251ad16fdafd9786aed10c3cad8cc8f44cee323f/vamp_gcp_audit-1.3.tar.gz"
  sha256 "719ca24f71b1c36c015360c448ae3069931773d3949e44d7d960efbb91f62987"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-gcp-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-gcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-gcp-audit --help 2>&1")
  end
end

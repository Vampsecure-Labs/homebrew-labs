# © VampSecure Studios — VampSecure Labs Security Research Division
class VampRagAudit < Formula
  include Language::Python::Virtualenv

  desc "RAG and agentic AI security auditor: prompt injection, context poisoning, data exfiltration"
  homepage "https://github.com/Vampsecure-Labs/vamp-rag-audit"
  url "https://files.pythonhosted.org/packages/08/e9/d16666a8e84101e65c8ad878b988fb5a27bb4aa88e49026ac43049e4c2ea/vamp_rag_audit-1.2.tar.gz"
  sha256 "2bc8f36c9ca4d279ae5f304f5e964c998d5038031349923dbb526a498513f048"
  license "AGPL-3.0-only"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-rag-audit==1.2"
    bin.install_symlink libexec/"bin/vamp-rag-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-rag-audit --help 2>&1")
  end
end

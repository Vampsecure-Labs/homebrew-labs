# © VampSecure Studios — VampSecure Labs Security Research Division
class VampRagAudit < Formula
  include Language::Python::Virtualenv

  desc "RAG and agentic AI security auditor: prompt injection, context poisoning, data exfiltration"
  homepage "https://github.com/Vampsecure-Labs/vamp-rag-audit"
  url "https://files.pythonhosted.org/packages/08/e9/d16666a8e84101e65c8ad878b988fb5a27bb4aa88e49026ac43049e4c2ea/vamp_rag_audit-1.3.tar.gz"
  sha256 "914eda3ebced0517a827ef29944722f4ffef031cdf3878602c068334e053d08a"
  license "AGPL-3.0-only"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-rag-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-rag-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-rag-audit --help 2>&1")
  end
end

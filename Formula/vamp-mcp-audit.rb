# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Model Context Protocol (MCP) endpoint security auditor"
  homepage "https://github.com/Vampsecure-Labs/vamp-mcp-audit"
  url "https://files.pythonhosted.org/packages/70/2e/3de1369275a8cc00e41d069216652d8358b8866777d4d756b8930a47f137/vamp_mcp_audit-2.3.tar.gz"
  sha256 "ce191301a1caaaacf3b25f72ace2241c26336bb0a29c1881cc705453a4b49c75"
  license "MIT"
  version "2.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mcp-audit==2.3"
    bin.install_symlink libexec/"bin/vamp-mcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mcp-audit --help 2>&1")
  end
end

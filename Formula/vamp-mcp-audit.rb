# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Model Context Protocol (MCP) endpoint security auditor"
  homepage "https://github.com/Vampsecure-Labs/vamp-mcp-audit"
  url "https://files.pythonhosted.org/packages/27/49/32876acdd2111e2e1ac6ccf02880ac346c17c0df27be2de80a5e411b1160/vamp_mcp_audit-2.1.tar.gz"
  sha256 "6a4b698c7312781825dc6d191c4b5856449fb819b29d79d92027cebd4201d9b8"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mcp-audit==2.1"
    bin.install_symlink libexec/"bin/vamp-mcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mcp-audit --help 2>&1")
  end
end

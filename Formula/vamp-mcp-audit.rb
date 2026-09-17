# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Model Context Protocol (MCP) endpoint security auditor"
  homepage "https://github.com/Vampsecure-Labs/vamp-mcp-audit"
  url "https://files.pythonhosted.org/packages/c4/a9/66faf7cdb362b11c32c8cc47d292458329a8a8288d6f1f9698e0c24bd6ed/vamp_mcp_audit-1.2.tar.gz"
  sha256 "c0f6b03da6b0219bbd92781fbfd67440f806f9f21096a0960ccb5c05a8055411"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mcp-audit==1.2"
    bin.install_symlink libexec/"bin/vamp-mcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mcp-audit --help 2>&1")
  end
end

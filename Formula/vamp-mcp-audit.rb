# © VampSecure Studios — VampSecure Labs Security Research Division
class VampMcpAudit < Formula
  include Language::Python::Virtualenv

  desc "Model Context Protocol (MCP) endpoint security auditor"
  homepage "https://github.com/Vampsecure-Labs/vamp-mcp-audit"
  url "https://files.pythonhosted.org/packages/9b/91/3e0fd32063a3bbfd3f80b6a550c27bc143ba817885fee6e528feeb176482/vamp_mcp_audit-1.1.tar.gz"
  sha256 "1a73eb31ec2fc8c2057800f7a292789201d061661577774f98a9e339ca6da594"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-mcp-audit==1.1"
    bin.install_symlink libexec/"bin/vamp-mcp-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-mcp-audit --help 2>&1")
  end
end

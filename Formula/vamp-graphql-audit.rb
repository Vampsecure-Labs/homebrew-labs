# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGraphqlAudit < Formula
  include Language::Python::Virtualenv

  desc "GraphQL endpoint security auditor for authorized penetration tests"
  homepage "https://github.com/Vampsecure-Labs/vamp-graphql-audit"
  url "https://files.pythonhosted.org/packages/80/5c/917b8043dd637625378f2c81b0494e1077af973f0bf6598dd34b06d28b0b/vamp_graphql_audit-1.4.0.tar.gz"
  sha256 "2de6ce16d8240d2a2e35560f511da8357ebb3d52ea71ec8f6ac2d73bde7114e8"
  license "MIT"
  version "1.4.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-graphql-audit==1.4.0"
    bin.install_symlink libexec/"bin/vamp-graphql-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-graphql-audit --help 2>&1")
  end
end

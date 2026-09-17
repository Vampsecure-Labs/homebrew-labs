# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGraphqlAudit < Formula
  include Language::Python::Virtualenv

  desc "GraphQL endpoint security auditor for authorized penetration tests"
  homepage "https://github.com/Vampsecure-Labs/vamp-graphql-audit"
  url "https://files.pythonhosted.org/packages/42/68/00b777f6733157c9eaad937096f3d124d79cd24192c8927ee62d08a0a023/vamp_graphql_audit-1.2.0.tar.gz"
  sha256 "052aa8c859ce75a61ca477abf78f11e7345c9cb42bbe1d3cc10147c59fe04aa7"
  license "MIT"
  version "1.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-graphql-audit==1.2.0"
    bin.install_symlink libexec/"bin/vamp-graphql-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-graphql-audit --help 2>&1")
  end
end

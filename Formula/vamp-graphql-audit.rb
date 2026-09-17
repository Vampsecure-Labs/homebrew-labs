# © VampSecure Studios — VampSecure Labs Security Research Division
class VampGraphqlAudit < Formula
  include Language::Python::Virtualenv

  desc "GraphQL endpoint security auditor for authorized penetration tests"
  homepage "https://github.com/Vampsecure-Labs/vamp-graphql-audit"
  url "https://files.pythonhosted.org/packages/9f/5f/22d5fadf473037a27dd9ebd37eb6d315ac14cee82a32551da018bedbdbcd/vamp_graphql_audit-1.1.1.tar.gz"
  sha256 "56b2760a48e91f1b7dcf0e76f448494fbec791ea1ec38b37a2d17c04bd91ac9b"
  license "MIT"
  version "1.1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-graphql-audit==1.1.1"
    bin.install_symlink libexec/"bin/vamp-graphql-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-graphql-audit --help 2>&1")
  end
end

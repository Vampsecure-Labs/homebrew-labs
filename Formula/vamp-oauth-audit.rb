# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOauthAudit < Formula
  include Language::Python::Virtualenv

  desc "OAuth 2.0 and OIDC security flow auditor — PKCE, state, implicit flow, open redirect"
  homepage "https://github.com/Vampsecure-Labs/vamp-oauth-audit"
  url "https://github.com/Vampsecure-Labs/vamp-oauth-audit/releases/download/v1.0/vamp_oauth_audit-1.0.tar.gz"
  sha256 "7d12a78cd0f68f242a9c25c33812dd18e8b5c194a9f82aa53ea9959968cfd773"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "aiohttp>=3.9.0"
    venv.pip_install "rich>=13.7.0"
    venv.pip_install_and_link_scripts buildpath
    bin.install_symlink libexec/"bin/vamp-oauth-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-oauth-audit --help 2>&1")
  end
end

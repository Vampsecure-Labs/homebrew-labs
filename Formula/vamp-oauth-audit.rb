# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOauthAudit < Formula
  include Language::Python::Virtualenv

  desc "OAuth 2.0 and OIDC security flow auditor — PKCE, state, redirect_uri, scope creep"
  homepage "https://github.com/Vampsecure-Labs/vamp-oauth-audit"
  url "https://files.pythonhosted.org/packages/93/ed/3e66fdb03a0b2424ebb99514eff1db2ec812f4de3024595e1be23f57dfee/vamp_oauth_audit-1.1.tar.gz"
  sha256 "43a3a117ceeabfc30e5e941df28881907b136f16e861c6866ebafaef28191c67"
  license "AGPL-3.0-only"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-oauth-audit==1.1"
    bin.install_symlink libexec/"bin/vamp-oauth-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-oauth-audit --help 2>&1")
  end
end

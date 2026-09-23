# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSubdomainTakeover < Formula
  include Language::Python::Virtualenv

  desc "Subdomain takeover vulnerability scanner for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-subdomain-takeover"
  url "https://files.pythonhosted.org/packages/e6/04/fc4864983298f4165e0cf154890090e2e48c9aa888f02878495f26f5fc29/vamp_subdomain_takeover-1.1.tar.gz"
  sha256 "deb5a3981903574b62a38cd2fafae78ac5ca0e2dd18e5eb03acc1f0ce168776a"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-subdomain-takeover==1.1"
    bin.install_symlink libexec/"bin/vamp-subdomain-takeover"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-subdomain-takeover --help 2>&1")
  end
end

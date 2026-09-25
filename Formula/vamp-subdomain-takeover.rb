# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSubdomainTakeover < Formula
  include Language::Python::Virtualenv

  desc "Subdomain takeover vulnerability scanner for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-subdomain-takeover"
  url "https://files.pythonhosted.org/packages/d0/5f/23ea5ad2ee0fd2c2866777921295f957700418b6792d71c156eed7738a4c/vamp_subdomain_takeover-1.3.tar.gz"
  sha256 "1809271bc4b556bd3fe93406f87e305b348a5348cb2b78ce1560316d95ff9326"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-subdomain-takeover==1.3"
    bin.install_symlink libexec/"bin/vamp-subdomain-takeover"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-subdomain-takeover --help 2>&1")
  end
end

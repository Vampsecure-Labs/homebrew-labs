# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSubdomainTakeover < Formula
  include Language::Python::Virtualenv

  desc "Subdomain takeover vulnerability scanner for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-subdomain-takeover"
  url "https://files.pythonhosted.org/packages/a1/39/5cdc2715103e4ffbb2585b4db18eb659d030488952f78d5ed18e0422665f/vamp_subdomain_takeover-1.2.tar.gz"
  sha256 "d33f8c9f09b479ddde61e7584dc7ba823bf229fc62f2dc50e6e5b918e3bc1216"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-subdomain-takeover==1.2"
    bin.install_symlink libexec/"bin/vamp-subdomain-takeover"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-subdomain-takeover --help 2>&1")
  end
end

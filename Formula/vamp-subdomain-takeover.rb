# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSubdomainTakeover < Formula
  include Language::Python::Virtualenv

  desc "Subdomain takeover vulnerability scanner for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-subdomain-takeover"
  url "https://files.pythonhosted.org/packages/94/f1/1c12c401a88f0ff1be387384b58c207e3b15bda07d23982f3cff30c85686/vamp_subdomain_takeover-1.0.tar.gz"
  sha256 "19ce5524ce3e21e587155c3df2269eef07474ff8c7d1412ad4adb104a94fcf1f"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-subdomain-takeover==1.0"
    bin.install_symlink libexec/"bin/vamp-subdomain-takeover"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-subdomain-takeover --help 2>&1")
  end
end

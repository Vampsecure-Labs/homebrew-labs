# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPassiveRecon < Formula
  include Language::Python::Virtualenv

  desc "Passive recon engine — subdomain enumeration, HTTP fingerprinting and GitHub dork scanning"
  homepage "https://github.com/Vampsecure-Labs/vamp-passive-recon"
  url "https://files.pythonhosted.org/packages/73/37/03d78908b33055b6fb93a5e8277193f8a879c48a7c8aea410315fbf43be5/vamp_passive_recon-1.1.0.tar.gz"
  sha256 "33440e24e5a75be156b2dde304be708a636995d744cedfa55bf4758570294d0d"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-passive-recon==1.1.0"
    bin.install_symlink libexec/"bin/vamp-passive-recon"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-passive-recon --help 2>&1")
  end
end

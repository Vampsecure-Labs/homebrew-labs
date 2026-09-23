# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPassiveRecon < Formula
  include Language::Python::Virtualenv

  desc "Passive recon engine — subdomain enumeration, HTTP fingerprinting and GitHub dork scanning"
  homepage "https://github.com/Vampsecure-Labs/vamp-passive-recon"
  url "https://files.pythonhosted.org/packages/aa/a3/d48fba46846dc84a9fa4e1256de66a2c6f1a95358b406a3f6a78b47320bb/vamp_passive_recon-1.3.0.tar.gz"
  sha256 "2951f45b7715ce0d418255f8419db1c6312470f9127940fb37f5844293b194c2"
  license "MIT"
  version "1.3.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-passive-recon==1.3.0"
    bin.install_symlink libexec/"bin/vamp-passive-recon"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-passive-recon --help 2>&1")
  end
end

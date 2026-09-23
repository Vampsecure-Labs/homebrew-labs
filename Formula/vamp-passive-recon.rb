# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPassiveRecon < Formula
  include Language::Python::Virtualenv

  desc "Passive recon engine — subdomain enumeration, HTTP fingerprinting and GitHub dork scanning"
  homepage "https://github.com/Vampsecure-Labs/vamp-passive-recon"
  url "https://files.pythonhosted.org/packages/94/a2/2dc86db26fe7863aa87fddc7f8951cf4c1dbce527500777ca1ab60a22777/vamp_passive_recon-1.2.0.tar.gz"
  sha256 "bffabcb9c56e6f30d4465d77cfe51fa5b7b4404f43337743e1ef31605df3e8f7"
  license "MIT"
  version "1.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-passive-recon==1.2.0"
    bin.install_symlink libexec/"bin/vamp-passive-recon"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-passive-recon --help 2>&1")
  end
end

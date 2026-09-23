# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDarkwebIntel < Formula
  include Language::Python::Virtualenv

  desc "Darkweb & threat intelligence CLI — cross-source IOC lookup with automatic correlation"
  homepage "https://github.com/Vampsecure-Labs/vamp-darkweb-intel"
  url "https://files.pythonhosted.org/packages/3a/aa/77f8216385099bbfeb3a92985d0c960e24f07870d66b8e5a25c6bac693eb/vamp_darkweb_intel-1.0.0.tar.gz"
  sha256 "ed9b3c8f9f4927028b5fc57259bc768d788e74c1f8b86bb178ce13628c027792"
  license "MIT"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-darkweb-intel==1.0.0"
    bin.install_symlink libexec/"bin/vamp-darkweb-intel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-darkweb-intel --help 2>&1")
  end
end

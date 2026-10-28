# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDarkwebIntel < Formula
  include Language::Python::Virtualenv

  desc "Darkweb & threat intelligence CLI — cross-source IOC lookup with automatic correlation"
  homepage "https://github.com/Vampsecure-Labs/vamp-darkweb-intel"
  url "https://files.pythonhosted.org/packages/a8/f8/c4325b7c1bbf19685eacdc21d1ed55ae503fb48bd2efc1673c354b72541f/vamp_darkweb_intel-1.3.1.tar.gz"
  sha256 "f8d4af38cfff3dae193c6039a6842a34bb84b839a03bd0462176e8336eaccd4a"
  license "MIT"
  version "1.3.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-darkweb-intel==1.3.1"
    bin.install_symlink libexec/"bin/vamp-darkweb-intel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-darkweb-intel --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDarkwebIntel < Formula
  include Language::Python::Virtualenv

  desc "Darkweb & threat intelligence CLI — cross-source IOC lookup with automatic correlation"
  homepage "https://github.com/Vampsecure-Labs/vamp-darkweb-intel"
  url "https://files.pythonhosted.org/packages/a8/f8/c4325b7c1bbf19685eacdc21d1ed55ae503fb48bd2efc1673c354b72541f/vamp_darkweb_intel-1.1.0.tar.gz"
  sha256 "28cf50aa785793d66b6433154e1c1581c9724a6cbbe4b6f73d905f118a2d1c87"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-darkweb-intel==1.1.0"
    bin.install_symlink libexec/"bin/vamp-darkweb-intel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-darkweb-intel --help 2>&1")
  end
end

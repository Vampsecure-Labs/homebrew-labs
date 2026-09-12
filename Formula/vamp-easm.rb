# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEasm < Formula
  include Language::Python::Virtualenv

  desc "External Attack Surface Management (EASM) scanner for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-easm"
  url "https://files.pythonhosted.org/packages/13/2d/17e19e4ed51ffc922e8024946230b748560ed3e8eb50bcb3054f11d77c2c/vamp_easm-1.1.tar.gz"
  sha256 "af39acda734b645e469163d29c0a521737ad118ae6ca9f1324723e9f875e2bfb"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-easm==1.1"
    bin.install_symlink libexec/"bin/vamp-easm"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-easm --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEasm < Formula
  include Language::Python::Virtualenv

  desc "External Attack Surface Management (EASM) scanner for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-easm"
  url "https://files.pythonhosted.org/packages/source/v/vamp-easm/vamp_easm-1.6.tar.gz"
  sha256 "6e1ec6ee1b160c7ebf0e141636d94c30fb7c0688d6b22002fd0adc1955592fe4"
  license "MIT"
  version "1.6"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-easm==1.6"
    bin.install_symlink libexec/"bin/vamp-easm"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-easm --help 2>&1")
  end
end

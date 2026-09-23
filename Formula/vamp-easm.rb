# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEasm < Formula
  include Language::Python::Virtualenv

  desc "External Attack Surface Management (EASM) scanner for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-easm"
  url "https://files.pythonhosted.org/packages/61/67/39edab48bd0565012468afe6925ebfc1e27e330557442e96176973f6c3c1/vamp_easm-1.4.tar.gz"
  sha256 "e88cb5f6f0d46b6e82d81ec01d6d78a4178584eebe83c70860a871c8eedbea10"
  license "MIT"
  version "1.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-easm==1.4"
    bin.install_symlink libexec/"bin/vamp-easm"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-easm --help 2>&1")
  end
end

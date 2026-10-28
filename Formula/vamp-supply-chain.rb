# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSupplyChain < Formula
  include Language::Python::Virtualenv

  desc "Supply chain security scanner: SBOM, CVE checks, typosquatting detection and checksum verification"
  homepage "https://github.com/Vampsecure-Labs/vamp-supply-chain"
  url "https://files.pythonhosted.org/packages/d5/76/f866d512c83f2a61585ec8f1bc541b82552718e050b8c72278ce319f6647/vamp_supply_chain-1.3.tar.gz"
  sha256 "582e714db13cc7620b71d025a59fec8c2650af14eeeaeab138c094ae807ccab0"
  license "AGPL-3.0-only"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-supply-chain==1.3"
    bin.install_symlink libexec/"bin/vamp-supply-chain"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-supply-chain --help 2>&1")
  end
end

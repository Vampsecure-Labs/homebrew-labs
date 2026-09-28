# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSupplyChain < Formula
  include Language::Python::Virtualenv

  desc "Supply chain security scanner: SBOM, CVE checks, typosquatting detection and checksum verification"
  homepage "https://github.com/Vampsecure-Labs/vamp-supply-chain"
  url "https://files.pythonhosted.org/packages/source/v/vamp-supply-chain/vamp_supply_chain-1.0.tar.gz"
  sha256 "d2ef9184d89e0b91d16f78a7b6e903a7877ff1da3e4ebb45bd2b6d6b088acd37"
  license "AGPL-3.0-only"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-supply-chain==1.0"
    bin.install_symlink libexec/"bin/vamp-supply-chain"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-supply-chain --help 2>&1")
  end
end

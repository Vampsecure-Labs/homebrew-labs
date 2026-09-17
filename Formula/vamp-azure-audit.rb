# © VampSecure Studios — VampSecure Labs Security Research Division
class VampAzureAudit < Formula
  include Language::Python::Virtualenv

  desc "Microsoft Azure security auditor — IAM, Storage, AKS, App Services, NSG, Key Vault, Defender"
  homepage "https://github.com/Vampsecure-Labs/vamp-azure-audit"
  url "https://github.com/Vampsecure-Labs/vamp-azure-audit/releases/download/v1.0/vamp_azure_audit-1.0.tar.gz"
  sha256 "22784a43204a252209edd427a91e65d7f8913a7dcb904354b727fdfd23946d56"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "aiohttp>=3.9.0"
    venv.pip_install "rich>=13.7.0"
    venv.pip_install_and_link_scripts buildpath
    bin.install_symlink libexec/"bin/vamp-azure-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-azure-audit --help 2>&1")
  end
end

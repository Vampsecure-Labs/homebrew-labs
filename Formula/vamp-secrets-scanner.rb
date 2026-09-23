# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSecretsScanner < Formula
  include Language::Python::Virtualenv

  desc "Static secrets and credentials scanner with git history analysis and Shannon entropy detection"
  homepage "https://github.com/Vampsecure-Labs/vamp-secrets-scanner"
  url "https://files.pythonhosted.org/packages/87/30/fe7a5c297773ad2382028e5b3416ac831c264361ffbd30a00283dc1da734/vamp_secrets_scanner-2.2.tar.gz"
  sha256 "9a067d03d9240a1841844e797afae7cedbb2ea65222ff6a8b47b0c3dadf96135"
  license "MIT"
  version "2.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-secrets-scanner==2.2"
    bin.install_symlink libexec/"bin/vamp-secrets-scanner"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-secrets-scanner --help 2>&1")
  end
end

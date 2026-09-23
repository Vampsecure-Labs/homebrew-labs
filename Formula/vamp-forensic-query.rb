# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForensicQuery < Formula
  include Language::Python::Virtualenv

  desc "Forensic SQL/log query engine for authorized digital investigations"
  homepage "https://github.com/Vampsecure-Labs/vamp-forensic-query"
  url "https://files.pythonhosted.org/packages/7a/ad/4550d750959181b42b48bd8e04c01ae6a9a3ad6bf6781c2cb960ae7fdb49/vamp_forensic_query-1.1.tar.gz"
  sha256 "7ac9b1753a1b401218cb0f5853a6a9884a5127cf732fc96adc320a96967fd8c4"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forensic-query==1.1"
    bin.install_symlink libexec/"bin/vamp-forensic-query"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forensic-query --help 2>&1")
  end
end

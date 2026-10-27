# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForensicQuery < Formula
  include Language::Python::Virtualenv

  desc "Forensic SQL/log query engine for authorized digital investigations"
  homepage "https://github.com/Vampsecure-Labs/vamp-forensic-query"
  url "https://files.pythonhosted.org/packages/70/23/375fa8197e1c297edc93681dae094d2103c5b567f49e139cb50dec02b6fa/vamp_forensic_query-1.3.tar.gz"
  sha256 "4a89d3fcc626b59a7aed29aff94087c07dfc3bc382147b9004fb42e6a0b25777"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forensic-query==1.3"
    bin.install_symlink libexec/"bin/vamp-forensic-query"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forensic-query --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForensicQuery < Formula
  include Language::Python::Virtualenv

  desc "Forensic SQL/log query engine for authorized digital investigations"
  homepage "https://github.com/Vampsecure-Labs/vamp-forensic-query"
  url "https://files.pythonhosted.org/packages/70/23/375fa8197e1c297edc93681dae094d2103c5b567f49e139cb50dec02b6fa/vamp_forensic_query-1.2.tar.gz"
  sha256 "8a1d8bc46a8d722c1211df477c0db735b8b52c61cdaef1d4e9799d4f564e6b65"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forensic-query==1.2"
    bin.install_symlink libexec/"bin/vamp-forensic-query"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forensic-query --help 2>&1")
  end
end

# © VampSecure Studios — VampSecure Labs Security Research Division
class VampIcmpShadow < Formula
  include Language::Python::Virtualenv

  desc "Covert ICMP channel demonstration tool for authorized Red/Blue Team labs"
  homepage "https://github.com/Vampsecure-Labs/vamp-icmp-shadow"
  url "https://files.pythonhosted.org/packages/fb/6b/c64c6cd8b4d284296cdce81590fea3c6ac9742b84c70d3ed95955d9eb1a2/vamp_icmp_shadow-1.2.tar.gz"
  sha256 "a3aa695bb8bb8e21b13f7ec1fe408c2dd72187acbb645ea7842ed8d681988394"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-icmp-shadow==1.2"
    bin.install_symlink libexec/"bin/vamp-icmp-shadow"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-icmp-shadow --help 2>&1")
  end
end

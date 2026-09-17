# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLogHunter < Formula
  include Language::Python::Virtualenv

  desc "Log hunting and threat-pattern scanner for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-log-hunter"
  url "https://files.pythonhosted.org/packages/60/c9/8eb845f2607ffad7f074842e9e041971b7d1d74d2f9c82fd37227e457f5c/vamp_log_hunter-1.1.tar.gz"
  sha256 "322800d3e6b6ff06b61ef58a663df6c7b2f7073cd6fc751b8089a850595174ff"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-log-hunter==1.1"
    bin.install_symlink libexec/"bin/vamp-log-hunter"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-log-hunter --help 2>&1")
  end
end

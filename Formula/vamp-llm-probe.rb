# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLlmProbe < Formula
  include Language::Python::Virtualenv

  desc "LLM API security auditor — prompt injection, jailbreak, ASCII smuggling"
  homepage "https://github.com/Vampsecure-Labs/vamp-llm-probe"
  url "https://files.pythonhosted.org/packages/64/e5/4826a5684d864237b2087731c91646c05ff530f21bc31f1db6c5663a2298/vamp_llm_probe-1.4.0.tar.gz"
  sha256 "648e421becbd34cd07eb8e25ea9a52563e6278d7d30740a2a34ec86e40e74f36"
  license "MIT"
  version "1.4.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-llm-probe==1.4.0"
    bin.install_symlink libexec/"bin/vamp-llm-probe"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-llm-probe --help 2>&1")
  end
end

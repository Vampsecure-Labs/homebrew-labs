# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLlmProbe < Formula
  include Language::Python::Virtualenv

  desc "LLM API security auditor — prompt injection, jailbreak, ASCII smuggling"
  homepage "https://github.com/Vampsecure-Labs/vamp-llm-probe"
  url "https://files.pythonhosted.org/packages/43/d1/77582a631b14c70691d8413eb4e84b6fc85ec466be877d49b2bfc4802328/vamp_llm_probe-1.6.0.tar.gz"
  sha256 "30fbe3a5e8a348e4f28f758f4ea8146af5f19ecc74eee067069b4be250dabc86"
  license "MIT"
  version "1.6.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-llm-probe==1.6.0"
    bin.install_symlink libexec/"bin/vamp-llm-probe"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-llm-probe --help 2>&1")
  end
end

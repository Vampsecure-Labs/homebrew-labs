# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEntropyWatch < Formula
  include Language::Python::Virtualenv

  desc "High-entropy file and process monitor for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-entropy-watch"
  url "https://files.pythonhosted.org/packages/eb/1c/98bf745abc8471752c303bc0385c3163caffb39565b57cb351c565c5fd69/vamp_entropy_watch-2.0.tar.gz"
  sha256 "6029818a650d4e0f348326f5b2fe335e2ef6fc74e308a6ce1b769b8054ac819f"
  license "MIT"
  version "2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-entropy-watch==2.0"
    bin.install_symlink libexec/"bin/vamp-entropy-watch"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-entropy-watch --help 2>&1")
  end
end

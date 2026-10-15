class Garmcli < Formula
  include Language::Python::Virtualenv

  desc "Read-only Garmin history, resumable sync, and JSON exports"
  homepage "https://github.com/matheuscoelhomalta/garmcli"
  url "https://github.com/matheuscoelhomalta/garmcli/releases/download/v1.0.0/garmcli-1.0.0.tar.gz"
  sha256 "e07d1eeeb5f8205d7abb0904d8f06c58cfba6159bd161ace4f7376a5b717c26c"
  license "MIT"

  depends_on "bpauli/tap/gccli"
  depends_on "python@3.14"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/95/9c/c510029fc6ef33a6275cd2c5d3cecd6613dfd6aa401d57c54f1c18852ccf/setuptools-84.0.0-py3-none-any.whl"
    sha256 "51a52592b3b99e102b609654876bd65f19f999935166d1352678931132b0c670"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install resource("setuptools"), build_isolation: false
    venv.pip_install_and_link buildpath, build_isolation: false
    (pkgshare/"skills").install "skills/garmcli"
  end

  def caveats
    <<~EOS
      Authenticate live Garmin access with:
        gccli auth login your-email@example.com

      The companion agent skill is installed at:
        #{opt_share}/garmcli/skills/garmcli
      Offline queries require previously synchronized history.
    EOS
  end

  test do
    assert_match "Read-only Garmin history", shell_output("#{bin}/garmcli --help")
    command = "#{bin}/garmcli --json --db #{testpath}/history.sqlite3 " \
              "--gccli #{testpath}/missing-gccli --account-id #{"a" * 64} " \
              "health sleep --from 2026-01-01 --to 2026-01-01 --offline"
    result = JSON.parse(shell_output(command, 1))
    assert_equal "1", result.fetch("schema_version")
    assert_equal false, result.fetch("complete")
    assert_equal "missing", result.fetch("data").fetch("records").first.fetch("status")
    assert_path_exists pkgshare/"skills/garmcli/SKILL.md"
  end
end

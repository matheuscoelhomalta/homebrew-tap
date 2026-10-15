class Garmcli < Formula
  include Language::Python::Virtualenv

  desc "Read-only Garmin history, resumable sync, and JSON exports"
  homepage "https://github.com/matheuscoelhomalta/garmcli"
  url "https://github.com/matheuscoelhomalta/garmcli/releases/download/v2.0.0/garmcli-2.0.0.tar.gz"
  sha256 "6aac9cbaf5b44f61e3b648ade625d513278bde6365ea5882eceb2036b708602b"
  license "MIT"

  depends_on "cffi"
  depends_on "python@3.14"

  on_macos do
    on_arm do
      resource "curl-cffi" do
        url "https://files.pythonhosted.org/packages/4c/86/e21b8ed384db26401a4438f20f01c7bcd9c3a6f8ceede458344e2d62775c/curl_cffi-0.16.3-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "f3b63da797912bc82911e34dfe449725514e4281527fb516931fc457087cfb44"
      end
    end

    on_intel do
      resource "curl-cffi" do
        url "https://files.pythonhosted.org/packages/79/7a/ec08ef0665c4ef4ea76b47042eb1c043e4afb374d8b9218e00272c9e73a2/curl_cffi-0.16.3-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "0f1f6878863fba393801e4d59b2f2766d1983b5c9d9dfa11d4becfd6a74cc937"
      end
    end
  end

  on_linux do
    depends_on "cryptography"

    resource "secretstorage" do
      url "https://files.pythonhosted.org/packages/b7/46/f5af3402b579fd5e11573ce652019a67074317e18c1935cc0b4ba9b35552/secretstorage-3.5.0-py3-none-any.whl"
      sha256 "0ce65888c0725fcb2c5bc0fdb8e5438eece02c523557ea40ce0703c266248137"
    end

    resource "jeepney" do
      url "https://files.pythonhosted.org/packages/b2/a3/e137168c9c44d18eff0376253da9f1e9234d0239e0ee230d2fee6cea8e55/jeepney-0.9.0-py3-none-any.whl"
      sha256 "97e5714520c16fc0a45695e5365a2e11b81ea79bba796e26f9f1d178cb182683"
    end

    on_arm do
      resource "curl-cffi" do
        url "https://files.pythonhosted.org/packages/97/2d/25b106e64178829be1ce171b6cd45ba354ab7a2a5169001866b38d4c440f/curl_cffi-0.16.3-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl"
        sha256 "d5a4103f2baa1fcf619ec3101b419827d367044ba106b206228137cc71a5a9c5"
      end
    end

    on_intel do
      resource "curl-cffi" do
        url "https://files.pythonhosted.org/packages/72/01/2bbf141baa0fc3921d31a90de5465b7a94188845a8fe84dee86bf7bd90f1/curl_cffi-0.16.3-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
        sha256 "a875a661e2f9a949be29454880bbb9553307a487c4c08819738298cf5c1622e2"
      end
    end
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/95/9c/c510029fc6ef33a6275cd2c5d3cecd6613dfd6aa401d57c54f1c18852ccf/setuptools-84.0.0-py3-none-any.whl"
    sha256 "51a52592b3b99e102b609654876bd65f19f999935166d1352678931132b0c670"
  end

  resource "garminconnect" do
    url "https://files.pythonhosted.org/packages/ad/9c/d465b4fd10cfa95ca9f2f75d61765e765d15b5a1ec6faf1890d3cf3b8a13/garminconnect-0.3.18-py3-none-any.whl"
    sha256 "a6acd253a0c836213a86ca2f038453559df5b453ebff7f7e7b72118dddb3a581"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/81/db/e655086b7f3a705df045bf0933bdd9c2f79bb3c97bfef1384598bb79a217/keyring-25.7.0-py3-none-any.whl"
    sha256 "be4a0b195f149690c166e850609a477c532ddbfbaed96a404d4e43f8d5e2689f"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a0/f4/c67b0b3f1b9245e8d266f0f112c500d50e5b4e83cb6f3b71b6528104182a/requests-2.34.2-py3-none-any.whl"
    sha256 "2a0d60c172f83ac6ab31e4554906c0f3b3588d37b5cb939b1c061f4907e278e0"
  end

  resource "ua-generator" do
    url "https://files.pythonhosted.org/packages/c6/03/d6ac97d7010451c43679c3efc46ff6b9e149cb3293ff93cf65f30fa58a54/ua_generator-2.1.6-py3-none-any.whl"
    sha256 "877285e6adab3d6b0f9b295d954d121fc21a0305be8526038218e8f08be76df6"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0b/a7/71ac2cff56fec219ed242bb11b8efb69fcc4bec75db06fb7bfe35de520e6/certifi-2026.7.22-py3-none-any.whl"
    sha256 "62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/fc/ad/d07d7862a62ffa6d79d68074d14823243dd235a77c45262acbf6adeb28bf/charset_normalizer-3.5.2-py3-none-any.whl"
    sha256 "b6b751274acb69d77b3323d6b7dbaa3c7fdfc1eb829b7eb61d262f32e1af9685"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/58/a2/bb081bab032533a855d44de1d56f8e8426114ff1ba5d1f07a438a0a654f8/idna-3.20-py3-none-any.whl"
    sha256 "ab7ae7122974553370f0bdb919e1a960b2cd1bc1ef0276416d896db81c14582c"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/92/9d/c4e665119135114480843e7ab388fa94d8480650450e6f8e26b70d323a4c/urllib3-2.8.0-py3-none-any.whl"
    sha256 "0cf3cae568d36aa9576b28dfb35f11328f1cb974ca7647d9475ebb86c75ac6e3"
  end

  resource "jaraco-classes" do
    url "https://files.pythonhosted.org/packages/7f/66/b15ce62552d84bbfcec9a4873ab79d993a1dd4edb922cbfccae192bd5b5f/jaraco.classes-3.4.0-py3-none-any.whl"
    sha256 "f662826b6bed8cace05e7ff873ce0f9283b5c924470fe664fff1c2f00f581790"
  end

  resource "jaraco-context" do
    url "https://files.pythonhosted.org/packages/f2/58/bc8954bda5fcda97bd7c19be11b85f91973d67a706ed4a3aec33e7de22db/jaraco_context-6.1.2-py3-none-any.whl"
    sha256 "bf8150b79a2d5d91ae48629d8b427a8f7ba0e1097dd6202a9059f29a36379535"
  end

  resource "jaraco-functools" do
    url "https://files.pythonhosted.org/packages/02/36/ecc85bc96c273dc8a11273ed4782272975e6338d4a3e9228621175edf0e3/jaraco_functools-4.6.0-py3-none-any.whl"
    sha256 "99e3dc0060c5cbe8fcd1cdb36258e2a65ca40f1566b2033b12abb1bb44dd3c30"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/5d/57/3c4b1c6f2e0cc29ba023802458ea3d2a996f87085559e4a5f2192d549532/more_itertools-11.2.1-py3-none-any.whl"
    sha256 "35a7377edd1dd6608dcb2cdf534ded55ea32d49448875ad042cd3f879fb1ded0"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")
    resources.each do |r|
      if r.name == "curl-cffi"
        # The resource installer only preserves pure-Python wheel archives.
        wheel = buildpath/Pathname.new(r.url).basename
        cp r.cached_download, wheel
        venv.pip_install wheel, build_isolation: false
      else
        venv.pip_install r, build_isolation: false
      end
    end
    venv.pip_install_and_link buildpath, build_isolation: false
    (pkgshare/"skills").install "skills/garmcli"
  end

  def caveats
    <<~EOS
      Authenticate live Garmin access with:
        garmcli auth login your-email@example.com

      Sessions use macOS Keychain or Linux Secret Service.
      Offline queries require previously synchronized history.
      The companion agent skill is installed at:
        #{opt_share}/garmcli/skills/garmcli
    EOS
  end

  test do
    assert_match "Read-only Garmin history", shell_output("#{bin}/garmcli --help")
    system libexec/"bin/python", "-c", "from garminconnect import Garmin; from curl_cffi import requests; " \
                                       "import keyring; s = requests.Session(); s.close(); Garmin()"
    command = "#{bin}/garmcli --json --db #{testpath}/history.sqlite3 " \
              "--account-id #{"a" * 64} " \
              "health sleep --from 2026-01-01 --to 2026-01-01 --offline"
    result = JSON.parse(shell_output(command, 1))
    assert_equal "1", result.fetch("schema_version")
    assert_equal false, result.fetch("complete")
    assert_equal "missing", result.fetch("data").fetch("records").first.fetch("status")
    assert_path_exists pkgshare/"skills/garmcli/SKILL.md"
  end
end

class Crabex < Formula
  desc "Route models and inspect context inside Codex"
  homepage "https://github.com/niieani/crabex"
  url "https://github.com/niieani/crabex/releases/download/v1.0.0/crabex-1.0.0.tgz"
  version "1.0.0"
  sha256 "b5d2b1482d578fff2f655013fe2e538b5290a961778565e9e6a9ab9249f1e908"
  license "MIT"

  depends_on "oven-sh/bun/bun"

  def install
    libexec.install "dist", "package.json", "LICENSE", "THIRD_PARTY_NOTICES.md", "THIRD_PARTY_LICENSES.txt"
    (bin/"crabex").write <<~SH
      #!/bin/sh
      exec "#{Formula["oven-sh/bun/bun"].opt_bin}/bun" "#{libexec}/dist/cli.mjs" "$@"
    SH
  end

  def caveats
    <<~EOS
      Run crabex proxy to start the proxy, or on macOS:
        crabex service install --https

      After brew upgrade, refresh an existing background service with:
        #{opt_bin}/crabex service install
      Inspect crabex service status and the reported worker log afterward.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/crabex --version").strip
    assert_match "crabex", shell_output("#{bin}/crabex --help")
  end
end

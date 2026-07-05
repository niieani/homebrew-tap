cask "caara" do
  version "1.2.0"

  if OS.mac? && Hardware::CPU.arm?
    sha256 "625b5caff9f9f09878fdd48f1ca558254f593b056644e17307109390830cf66d"
    url "https://github.com/niieani/caara/releases/download/v1.2.0/caara_1.2.0_darwin_arm64.tar.gz"
  elsif OS.linux? && Hardware::CPU.intel?
    sha256 "71c63e69f5f4d55810d981accf5a6d45d74b504051b8a4ff3e6b3a9594f5274d"
    url "https://github.com/niieani/caara/releases/download/v1.2.0/caara_1.2.0_linux_amd64.tar.gz"
  elsif OS.linux? && Hardware::CPU.arm?
    sha256 "24ee613a1d55f5c48887ad667a4deb50c309e9b90c51762999734a223db581e2"
    url "https://github.com/niieani/caara/releases/download/v1.2.0/caara_1.2.0_linux_arm64.tar.gz"
  else
    odie "Caara release artifacts support Apple Silicon macOS, Linux x64, and Linux arm64."
  end

  name "Caara"
  desc "OpenAI-compatible Responses API wrapper for local code agents"
  homepage "https://github.com/niieani/caara"

  binary "caara"

  postflight do
    system_command "#{staged_path}/caara", args: ["install-service"], sudo: false
  end

  uninstall_preflight do
    system_command "#{staged_path}/caara", args: ["uninstall-service"], sudo: false
  end

  zap trash: [
    "~/.config/caara",
    "~/.local/state/caara",
    "~/Library/Application Support/caara",
    "~/Library/Logs/caara",
  ]
end

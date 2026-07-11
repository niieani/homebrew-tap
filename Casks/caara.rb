cask "caara" do
  version "1.2.1"

  if OS.mac? && Hardware::CPU.arm?
    sha256 "69523376624b1b01af9749abe527940a8727f08f562f25f5b99d4d18d8b2999c"
    url "https://github.com/niieani/caara/releases/download/v1.2.1/caara_1.2.1_darwin_arm64.tar.gz"
  elsif OS.linux? && Hardware::CPU.intel?
    sha256 "791c243bec4394345f3beb4c7d31866635ccf797d756668755c1b974e0b66994"
    url "https://github.com/niieani/caara/releases/download/v1.2.1/caara_1.2.1_linux_amd64.tar.gz"
  elsif OS.linux? && Hardware::CPU.arm?
    sha256 "7a52d8cf2d255b69b3262a4840afe5513e4dfc5d8c1d5fd58ba6eec845232e41"
    url "https://github.com/niieani/caara/releases/download/v1.2.1/caara_1.2.1_linux_arm64.tar.gz"
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

cask "caara" do
  version "1.1.0"

  if OS.mac? && Hardware::CPU.arm?
    sha256 "895871e74817e3990f59a982960c936e3a2fbc18912909e5271f11ccacc3cb5c"
    url "https://github.com/niieani/caara/releases/download/v1.1.0/caara_1.1.0_darwin_arm64.tar.gz"
  elsif OS.linux? && Hardware::CPU.intel?
    sha256 "8c708c6bc02ffa3d6d5c2ecd2072a1eeaaa7515771337748294e0ec285d726df"
    url "https://github.com/niieani/caara/releases/download/v1.1.0/caara_1.1.0_linux_amd64.tar.gz"
  elsif OS.linux? && Hardware::CPU.arm?
    sha256 "386695c8f0fda017399a542bf955754a4b2c8f5e48c457bce732d0a05b815d7a"
    url "https://github.com/niieani/caara/releases/download/v1.1.0/caara_1.1.0_linux_arm64.tar.gz"
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

cask "agentsmith" do
  version "0.2.0"
  sha256 "2ab2f3a3acc4efc625b600f185ac3e8e7ac3a90cfd0e2026ae0f51bdcb97f624"

  url "https://github.com/niieani/agentsmith/releases/download/v#{version}/agentsmith_#{version}_darwin_arm64.tar.gz"
  name "agentsmith"
  desc "Assemble agent instructions and skills from reusable, scope-aware sources"
  homepage "https://github.com/niieani/agentsmith"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  binary "asmith"
end

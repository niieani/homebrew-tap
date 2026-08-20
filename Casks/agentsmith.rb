cask "agentsmith" do
  version "0.3.0"
  sha256 "735ee4c1838629530866f4ad2479afeb35f4852a793731e63d439ff38799f036"

  url "https://github.com/niieani/agentsmith/releases/download/v#{version}/agentsmith_#{version}_darwin_arm64.tar.gz"
  name "agentsmith"
  desc "Assemble agent instructions and skills from reusable, scope-aware sources"
  homepage "https://github.com/niieani/agentsmith"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  binary "asmith"
end

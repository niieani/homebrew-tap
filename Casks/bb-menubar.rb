cask "bb-menubar" do
  version "0.10.1"
  sha256 "61affcad95c401438d309c2bb04e787f5280020bc0b0f37c929f28404115402e"

  url "https://github.com/niieani/bb-project/releases/download/v#{version}/BBMenuBar_#{version}_macOS.zip"
  name "BB Menu Bar"
  desc "Native menu bar status for bb-managed Git repositories"
  homepage "https://github.com/niieani/bb-project"

  depends_on cask: "bb"
  depends_on macos: ">= :sonoma"

  app "BBMenuBar.app"

  zap trash: "~/Library/Preferences/dev.niieani.bb-menubar.plist"
end

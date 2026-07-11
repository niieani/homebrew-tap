cask "bb-menubar" do
  version "0.10.2"
  sha256 "c33d4294334d36363fb37a9913e6fe7b8fda2f632b08d3edabcbcdaeff7a9f83"

  url "https://github.com/niieani/bb-project/releases/download/v#{version}/BBMenuBar_#{version}_macOS.zip"
  name "BB Menu Bar"
  desc "Native menu bar status for bb-managed Git repositories"
  homepage "https://github.com/niieani/bb-project"

  depends_on cask: "bb"
  depends_on macos: ">= :sonoma"

  app "BBMenuBar.app"

  zap trash: "~/Library/Preferences/dev.niieani.bb-menubar.plist"
end

cask "decaf" do
  version "0.3.3"
  sha256 "acbe1c94e4b0685a5c9f572c4fa759469fc958f4a006a74de23f6ab883901daf"

  url "https://github.com/AlanY1an/decaf/releases/download/v#{version}/Decaf-#{version}.dmg",
      verified: "github.com/AlanY1an/decaf/"
  name "Decaf"
  desc "Automatic agent keep-awake and local Claude Code/Codex token statistics"
  homepage "https://github.com/AlanY1an/decaf"

  # SwiftUI openSettings and the two-parameter onChange(of:) both landed in
  # Sonoma, and the detection layer is built on the concurrency model that came
  # with it. The bare symbol is a MINIMUM, not an exact match — the string
  # comparison form that reads like one is deprecated.
  depends_on macos: :sonoma

  app "Decaf.app"

  uninstall quit: "io.github.alany1an.decaf"

  # Everything Decaf writes. The hook entries it can add to
  # ~/.claude/settings.json are deliberately NOT zapped: that file belongs to
  # Claude Code, and removing another tool's config from a cask would be
  # overreach. Settings -> Agents -> Uninstall Hooks is the reversible path,
  # and the README says so.
  zap trash: [
    "~/Library/Application Support/Decaf",
    "~/Library/Preferences/io.github.alany1an.decaf.plist",
  ]
end

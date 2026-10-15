cask "decaf" do
  version "0.4.0"
  sha256 "c0346a62d6d79df9ee97aa50d7962c2c22cec24a1e2f4313294a12a9c80eef5e"

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

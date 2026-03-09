cask "credctl" do
  version "0.1.3"
  sha256 "d1b17d5eccafc8842d09f673ed05bbe46f614133e8f6dbf01af05fdc7c294f48"

  url "https://github.com/credctl/credctl/releases/download/v#{version}/credctl-#{version}-darwin-arm64.tar.gz"
  name "credctl"
  desc "Machine identity management with macOS Secure Enclave"
  homepage "https://credctl.com"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "credctl.app"
  binary "#{appdir}/credctl.app/Contents/MacOS/credctl"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/credctl.app"],
                   sudo: false
  end

  zap trash: "~/.credctl"
end

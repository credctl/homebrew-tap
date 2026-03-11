cask "credctl" do
  version "0.1.4"
  sha256 "6da6216b0dacf334cef889163e801fb323e7cb932687fa755c8c7cddadee0cc7"

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

cask "credctl" do
  version "0.1.3"
  sha256 "dadab05ecd5d356dc0ef020e395838ecad8ae299c22b90e96613696e2856c753"

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

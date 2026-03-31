cask "credctl" do
  version "1.2.3"
  sha256 "04baaa4cccdad52bbd4637f6026fecc2553ef4f87f195554774ba3e9b4fb321c"

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

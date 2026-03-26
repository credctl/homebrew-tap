cask "credctl" do
  version "1.1.1"
  sha256 "0e13feda93b82360c6be81532eb82d1bc32d2c752a7f5e36c4d1f7315bb14c2c"

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

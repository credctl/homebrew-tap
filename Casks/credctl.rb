cask "credctl" do
  version "0.1.2"
  sha256 "ba5441a8781dfb880a95213b7902bb6194bb4962a4c799f88493084d1d322237"

  url "https://github.com/credctl/credctl/releases/download/v#{version}/credctl-#{version}-darwin-arm64.tar.gz"
  name "credctl"
  desc "Machine identity management with macOS Secure Enclave"
  homepage "https://credctl.com"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "credctl.app"
  binary "#{appdir}/credctl.app/Contents/MacOS/credctl"

  zap trash: "~/.credctl"
end

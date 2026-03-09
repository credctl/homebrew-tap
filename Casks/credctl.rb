cask "credctl" do
  version "0.1.2"
  sha256 "e11419e3dce7ab16318ddb54b6425fbd94be0f7f513da7c9b9bd3450326d8bce"

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

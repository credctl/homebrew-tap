cask "credctl" do
  version "0.1.1"
  sha256 "3dffc6f78002c840cea1bd9374234dedb6c4e62a438d1a858ff110f8a34a26e3"

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

class Afcclient < Formula
  desc "Simple CLI interface to AFC via libimobiledevice"
  homepage "https://github.com/lechium/afcclient"
  url "https://github.com/lechium/afcclient.git",
    tag:      "1.0",
    revision: "2f0e729ca1eb3805280629e6f3350b9238fef318"
  license "MIT"
  head "https://github.com/lechium/afcclient.git",
    branch: "master"

  depends_on "libimobiledevice"

  def install
    cmd = "mkdir build"
    value = `#{cmd}`
    print value
    system ENV.cc,  "-o", "build/afcclient", "afcclient/libidev.c", "afcclient/afcclient.c",
                    "-Iafcclient",
                    "-lusbmuxd-2.0", "-lplist-2.0", "-lssl", "-lcrypto", "-limobiledevice-1.0",
                    "-limobiledevice-glue-1.0", "-v"
    bin.install "build/afcclient"
  end

  test do
    system bin/"afcclient", "-l"
  end
end

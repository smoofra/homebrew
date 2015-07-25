class Rtags < Formula
  desc "ctags-like source code cross-referencer with a clang frontend"
  homepage "https://github.com/Andersbakken/rtags"

  url "https://github.com/Andersbakken/rtags.git",
      :tag => "v2.0",
      :revision => "ba85598841648490e64246be802fc2dcdd45bc3c"

  head "https://github.com/Andersbakken/rtags.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "llvm" => "with-clang"
  depends_on "openssl"

  option :dsym

  def install
    # Homebrew llvm libc++.dylib doesn't correctly reexport libc++abi
    ENV.append("LDFLAGS", "-lc++abi")

    mkdir "build" do
      system "cmake", "..", "-G", "Ninja", *std_cmake_args
      system "ninja", "install"
      install_dsym if build.dsym?
    end
  end

  test do
    system "sh", "-c", "rc >/dev/null --help  ; test $? == 1"
  end
end

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Commitwhisper < Formula
  desc ""
  homepage "https://github.com/Coien-rr/CommitWhisper"
  url "https://github.com/Coien-rr/CommitWhisper/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "c52b916c6c3f8c6318ad3ff488987c08c0ccf406d8ea8e6838e9fdd34c3b3d12"
  license ""

  depends_on "go" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    ENV["GOPROXY"] = "https://goproxy.cn"
    system "make", "build"
    bin.install "cw"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test CommitWhisper`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end

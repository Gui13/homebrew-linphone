require 'formula'

class Libantlr34c < Formula
  # Antlr4 is the current main, but some people may need Antlr3,
  # which has support for a C API. This version here is a patched version that allows for 
  # multiarch compilation. It comes from git://git.linphone.org/antlr3
  url "https://github.com/Gui13/homebrew-linphone/releases/download/0.9/libantlr3c-3.4-beta3.tar.gz"
  homepage 'http://www.antlr3.org/'
  sha1 '1afeafb4d697177d8f1c0f0d76d8f9cfbb171eb6'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
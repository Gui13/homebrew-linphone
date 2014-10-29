require 'formula'

class Libantlr32c < Formula
  # Antlr4 is the current main, but some people may need Antlr3,
  # which has support for a C API.
  url "http://www.antlr3.org/download/C/libantlr3c-3.2.tar.gz"
  homepage 'http://www.antlr3.org/'
  sha1 '89bfa4fbed8af7e089bff065a1ac8834a8deb493'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
require 'formula'

class Antlr32 < Formula
  # Antlr4 is the current main, but some people may need Antlr3,
  # which has support for a C API.
  url "http://www.antlr3.org/download/antlr-3.2.jar"
  homepage 'http://www.antlr.org/'
  sha1 'a571944d1c199ca7da187e163f0af3183e2a3be5'

  def install
    prefix.install "antlr-3.2.jar"
    (share+"java").install_symlink "#{prefix}/antlr-3.2.jar" => "antlr3.jar"
    (bin+"antlr-3.2").write <<-EOS.undent
    #!/bin/sh
    java -jar #{prefix}/antlr-3.2.jar "$@"
    EOS
    bin.install_symlink bin/"antlr-3.2" => "antlr3"
  end
end

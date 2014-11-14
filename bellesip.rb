require 'formula'

class Bellesip < Formula

  url "https://github.com/Gui13/belle-sip/releases/download/1.3.4-gh/belle-sip-1.3.4-gh.tar.gz"
  homepage 'http://www.linphone.org/'
  sha1 '2f8b416ae2530ac221163815fedeb50aa27e8d31'

  depends_on "gui13/linphone/libantlr3.4c"
  depends_on "gui13/linphone/antlr3.2" => :build

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
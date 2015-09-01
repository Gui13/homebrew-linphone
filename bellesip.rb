require 'formula'

class Bellesip < Formula

  url "https://github.com/BelledonneCommunications/belle-sip.git", :using => :git, :revision => 'ad48d8c538ce998707e0e1daceac23ba3636ecfa', :tag => '1.4.1'
  head "https://github.com/BelledonneCommunications/belle-sip.git", :using => :git, :branch => 'master'
  homepage 'http://www.linphone.org/'
  depends_on "gui13/linphone/libantlr3.4c"
  depends_on "gui13/linphone/antlr3.2" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "polarssl"


  def install
    ENV.append_path "PATH", "/usr/local/bin"
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end

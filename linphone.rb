require 'formula'

class Linphone < Formula

  url "https://github.com/Gui13/linphone/releases/download/3.7.1-gh/linphone-3.7.1-gh.tar.gz"
  homepage 'http://www.linphone.org/'
  sha1 'da45a653fc1afe2ebf2ded26676b83fe927707e7'

  depends_on "gui13/linphone/bellesip"
  depends_on "mattintosh4/gtk-mac-integration/gtk-mac-integration"
  depends_on "gettext"
  depends_on "libxml2"
  depends_on "ffmpeg"
  depends_on "speex"
  depends_on "readline"
#  depends_on "srtp"
  depends_on "libvpx"
  depends_on "sqlite"
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "intltool" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build


  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-tests", "--disable-x11"
    system "make install"
  end
end

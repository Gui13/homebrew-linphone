require 'formula'

class Linphone < Formula

  url "https://github.com/Gui13/linphone/releases/download/3.7.1-gh/linphone-3.7.1-gh.tar.gz"
  homepage 'http://www.linphone.org/'
  sha1 'da45a653fc1afe2ebf2ded26676b83fe927707e7'

  depends_on "gui13/linphone/bellesip"
  depends_on "marekjelen/gtk/gtk+-quartz"
  depends_on "gettext"
  depends_on "libxml2"
  depends_on "ffmpeg"
  depends_on "speex"
  depends_on "readline"
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "intltool" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build


  def install
	#system "./autogen.sh" # only for dev
	# ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	# ENV.append_path "PKG_CONFIG_LIBDIR", "#{lib}/pkgconfig"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-tests"
    system "make install"
  end
end

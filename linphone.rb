require 'formula'

class Linphone < Formula

  url "https://github.com/BelledonneCommunications/linphone.git", :using => :git, :revision => '1e1f663ff9531af59e24af73370d10c0cdc24831', :tag => '3.8.5'
  head "https://github.com/BelledonneCommunications/linphone.git", :using => :git, :branch => 'master'
  homepage 'http://www.linphone.org/'

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
	  system "./autogen.sh" # only for dev
	# ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	# ENV.append_path "PKG_CONFIG_LIBDIR", "#{lib}/pkgconfig"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-tests"
    system "make install"
  end
end

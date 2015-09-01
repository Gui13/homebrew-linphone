require 'formula'

class Linphone < Formula

  url "https://github.com/BelledonneCommunications/linphone.git", :revision => '1e1f663ff9531af59e24af73370d10c0cdc24831', :tag => '3.8.5', :shallow => false
  head "https://github.com/BelledonneCommunications/linphone.git", :branch => 'master', :shallow => false
  homepage 'http://www.linphone.org/'

  depends_on "gui13/linphone/bellesip"
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

  option "with-debug", "Enable debug compilation"
  option "with-gtk", "Enable the GTK GUI"

  if build.with? "gtk"
      depends_on "marekjelen/gtk/gtk+-quartz"
  end

  def install
	  system "./autogen.sh"

    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --disable-tests
    ]

    if build.with? "debug"
      args << "--enable-debug=yes"
    else
      args << "--enable-debug=no"
    end

    if build.without? "gtk"
      args << "--without-x11"
      args << "--enable-gtk_ui=no"
    end
    ENV.append_path "PATH", "/usr/local/bin"

	# ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	# ENV.append_path "PKG_CONFIG_LIBDIR", "#{lib}/pkgconfig"

    system "./configure", *args
    system "make", "install", "VERBOSE=1", "V=1"
  end
end

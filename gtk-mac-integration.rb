require 'formula'

class GtkMacIntegration < Formula
  homepage 'https://live.gnome.org/GTK+/OSX'
  url 'ftp://ftp.gnome.org/pub/gnome/sources/gtk-mac-integration/2.0/gtk-mac-integration-2.0.5.tar.xz'
  sha1 '74e43c2fff14ca4aff3a8f6c35660bedc7a349a1'
  head 'git://git.gnome.org/gtk-mac-integration'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'gtk+'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"

    system "make install"

    prefix.install "src/.libs/test-integration"
    (prefix + "src").install "src/testui.xml"
  end

  test do
    system "cd #{prefix} && ./test-integration"
  end
end

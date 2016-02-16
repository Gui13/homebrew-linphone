require "formula"

class Ortp < Formula
	desc "oRTP library"
	homepage "http://www.linphone.org/technical-corner/ortp/"
	url "http://download.savannah.gnu.org/releases/linphone/ortp/sources/ortp-0.25.0.tar.gz"
	sha256 "0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a"

	depends_on "pkg-config" => :build
	depends_on "libtool" => :build
	depends_on "intltool" => :build
	depends_on "autoconf" => :build
	depends_on "automake" => :build
	depends_on "openssl"

	def install
		system "./autogen.sh"
		system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
		system "make", "install"
		
	end
	
end
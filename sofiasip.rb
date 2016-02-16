require "formula"

class Sofiasip < Formula
	desc "Sofia sip user agent"
	homepage "https://github.com/BelledonneCommunications/sofia-sip"
	url "https://github.com/BelledonneCommunications/sofia-sip/archive/bc.tar.gz"
	sha256 "e69b11bb399588a5d8c08fa3ef14806680537572b6ac57fe90391a7a8eba7706"
	version "0.13bc"

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
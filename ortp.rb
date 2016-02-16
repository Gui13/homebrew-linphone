require "formula"

class Ortp < Formula
	desc "oRTP library"
	homepage "http://www.linphone.org/technical-corner/ortp/"
	url "https://github.com/BelledonneCommunications/ortp/archive/0.25.0.tar.gz"
	sha256 "cc76bf057b362332a0b3143d4d1fdf6d8651fb2f161f30b575071665e9dac231"
	head "https://github.com/BelledonneCommunications/ortp.git"

	depends_on "cmake" => :build
	depends_on "openssl"

	def install
		system "cmake", ".", *std_cmake_args
		system "make", "install"
		
	end
	
end
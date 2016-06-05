require "formula"

class Bctoolbox < Formula
	desc "BCToolbox library"
	homepage "https://www.linphone.org"
	url "http://www.linphone.org/snapshots/sources/bctoolbox/bctoolbox-0.0.3-Source.tar.gz"
	sha256 "204442fe1a4947c0a74d6d8125d9f51443fb58190ad799d86e9f6bf57dddadee"
	head "https://github.com/BelledonneCommunications/bctoolbox.git"

	depends_on "cmake" => :build
	depends_on "mbedtls"

	def install
		args = std_cmake_args
		args << "-DENABLE_MBEDTLS=ON -DENABLE_POLARSSL=NO"
		system "cmake", ".", *args
		system "make", "install"
		
	end
	
end

require "formula"

class Bctoolbox < Formula
	desc "BCToolbox library"
	homepage "https://www.linphone.org"
	url "http://www.linphone.org/snapshots/sources/bctoolbox/bctoolbox-0.0.2-Source.tar.gz"
	sha256 "95b25171f0df2689be78e6cb6cfb5e0316197b0f2bb7a0c50c4072cd606b1614"
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
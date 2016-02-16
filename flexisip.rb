require "formula"

class Flexisip < Formula
	desc "The Flexisip server"
	homepage "http://www.linphone.org/technical-corner/flexisip/overview"
	url "https://github.com/BelledonneCommunications/flexisip/archive/1.0.8.tar.gz"
	head "https://github.com/BelledonneCommunications/flexisip.git"

	depends_on "cmake" => :build
	depends_on "openssl"
	depends_on "gui13/linphone/sofiasip"
	depends_on "gui13/linphone/ortp"
	depends_on "odb" => :optional
	
	option "with-transcoder", "Compile with transcoder option"
	if build.with? "transcoder"
		depends_on "gui13/linphone/mediastreamer2"
	end

	def install
		args = std_cmake_args

		args << "-DENABLE_DOC=NO"

		if build.without? "odb"
			args << "-DENABLE_ODB=NO"
		end

		if build.without? "transcoder"
			args << "-DENABLE_TRANSCODER=NO"
		end

		system "cmake", ".", *args
		system "make", "install"
		
	end
	
end
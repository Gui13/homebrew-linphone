require 'formula'

class Bellesip < Formula

  url "https://github.com/BelledonneCommunications/belle-sip.git", :using => :git, :revision => 'ad48d8c538ce998707e0e1daceac23ba3636ecfa', :tag => '1.4.1'
  head "https://github.com/BelledonneCommunications/belle-sip.git", :using => :git, :branch => 'master'
  homepage 'http://www.linphone.org/'
  depends_on "gui13/linphone/libantlr3.4c"
  depends_on "homebrew/versions/antlr3" => :build
  depends_on "gui13/linphone/bctoolbox" => :head
  depends_on "cmake" => :build
  depends_on "polarssl"


  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end

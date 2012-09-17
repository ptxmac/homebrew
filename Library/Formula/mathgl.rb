require 'formula'

class Mathgl < Formula
  homepage 'http://mathgl.sourceforge.net/'
  url 'http://downloads.sourceforge.net/mathgl/mathgl-2.0.3.tar.gz'
  sha1 'c032cf53de3f6d3d5e45f6ff9e26889617770f02'

  depends_on 'cmake' => :build
  depends_on 'gsl'
  depends_on :libpng

  def install
    ENV['LIBS'] = '-lz'

    # Fixed upstream: this line can be removed when v2 is released
#    inreplace ["mgl/mgl_export.cpp", "mgl/mgl_data_png.cpp"] do |s|
#      s.gsub! /#include <png.h>/, "#include <zlib.h>\n#include <png.h>"
#    end

    #system "./configure", "--prefix=#{prefix}"
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    mktemp do
      system "#{bin}/mgl_example"
    end
  end
end
